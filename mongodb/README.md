# MongoDB Ops Manager
The point of this folder is to be able to create an entire MongoDB Ops Manager cluster within docker containers.

# How to use

## Create a network in Docker
 * Use the folder 1-network. 
 * This network will link all the following containers together.

## Create a MongoDB for Ops Manager
 * Use the folder 2-mongodb-ops
 * Create an administration MongoDB instance which is required by MongoDB Ops Manager.
 * This MongoDB database will store all the metadata Ops Manager needs to run.

## Start Ops Manager
 * Start the Ops Manager process with the folder 3-ops-manager.
 * First you need to download the deb file required to build the Docker image.
 * If the version changed, update the Dockerfile.
 * Use the docker-build.sh script to build and tag the image.
 * Then run the container with the docker-run.sh script.
 * Note that the Dockerfile contains a sed line to configure the address of the database we just created : mongodb-ops:28000
 * The container exposes a web interface on the port 8080 we map to the port 8080 of our host.

## Configure Ops Manager
 * Open a browser to http://localhost:8080
 * Create the first user that will automatically get the Admin rights.
   - email : john.doe@gmail.com
   - password : password1!
   - First Name : John
   - Last Name : Doe
   - tick the Evaluation Agreement box
 * Configure Ops Manager as follow (everything not specified can stay blank or with the default value) : 
   - Url to access ops manager : http://ops-manager:8080 (it's his address in the Docker network)
   - "From" Email Address : john.doe@gmail.com
   - "Reply To" Email Address : john.doe@gmail.com
   - Admin Email Address : john.doe@gmail.com
   - Email Devivery Method Configuration : SMTP Email Server (example with gmail for the next lines - feel free to adapt to your needs)
   - Transport : smtp
   - SMTP Server Hostname : smtp.gmail.com
   - SMTP Server Port : 587
   - Username : john.doe@gmail.com
   - Password : your gmail password
   - Use TLS/SSL : true
   - To make this gmail connection works, you need to authorise "Less secure apps" : https://myaccount.google.com/lesssecureapps
   - click on "continue" 5 times.
   - On the interface, select the time zone at the top right corner.

## Start containers with automation agents
 * First we need a some stuff : deb file, mmsGroupId and mmsApiKey
 * Click on "Manage Existing", then "Install Agent" -> Ubuntu (15.x, 16.x) - DEB.
 * Download the automation agent deb file
   - with the Curl command but you need to replace the host "ops-manager" by "localhost" (see download-deb.sh script).
   - or you can use the online version you can find here : https://docs.cloudmanager.mongodb.com/tutorial/install-automation-agent-with-deb-package/ (see download-deb.sh script).
 * Click on Generate Key to generate your API key.
 * Copy paste the mmsGroupId and the mmsApiKey you get - we will need that in a minute.
 * Cancel and come back on the main screen - Deployment.
 * Build and tag the image with docker-build.sh
 * Run the docker-run.sh to see the usage : Usage : ./docker-run.sh quantityAgents mmsBaseUrl mmsGroupId mmsApiKey
 * Now you can choose how many containers you want to run by running this command : `./docker-run.sh 3 http://ops-manager:8080 your-mmsGroupId your-mmsApiKey.` (3 is the number of agents you want).
 * With `docker ps` you should see something like this :
```
CONTAINER ID        IMAGE                          COMMAND                  CREATED             STATUS              PORTS                                 NAMES
6f8cb929c661        mabeulux88/mongodb-agent:1.0   "/opt/mongodb-mms-..."   17 seconds ago      Up 16 seconds       0.0.0.0:27019->27017/tcp              agent-3
35ea5976119f        mabeulux88/mongodb-agent:1.0   "/opt/mongodb-mms-..."   17 seconds ago      Up 16 seconds       0.0.0.0:27018->27017/tcp              agent-2
f46f824c073b        mabeulux88/mongodb-agent:1.0   "/opt/mongodb-mms-..."   18 seconds ago      Up 17 seconds       0.0.0.0:27017->27017/tcp              agent-1
b64f82c55e6a        mabeulux88/ops-manager:1.0     "/entrypoint.sh"         About an hour ago   Up About an hour    0.0.0.0:8080->8080/tcp                ops-manager
603b064fb62b        mongo:3.4.9                    "docker-entrypoint..."   2 hours ago         Up 2 hours          27017/tcp, 0.0.0.0:28000->28000/tcp   mongodb-ops
```
 * On the Deployment view, click on the "Servers" tab. You should see your X agents.

![Deployment - Servers](/mongodb/screenshots/deployment-servers.png?raw=true "Deployment - Servers")

## Configure Backup
 * If you haven't already done so, ask the automation agent to install a Monitoring and a Backup Agent for you on any agent server from the Deployment -> Servers screen just by clicking on one of the agent "..." button.
 * Click on "Backup" on the left side and "configure the backup module".
 * The HEAD directory was created in the ops-manager Dockerfile : `/backup`
 * Enable Daemon
 * Configure a File System Store. Choose `/backup` again.
 * Now for the point in time recovery, Ops Manager needs another MongoDB Database to backup Oplogs.
 * In the folder 5-mongodb-backup you can run a new container "mongodb-backup" on port 29000 still in the `netmongo` Docker network.
 * \<hostname\>:\<port\> : mongodb-backup:29000
 * MongoDB Auth username : leave blank (If in production activate properly the --auth at least with a decent user!)
 * MongoDB Auth password : leave blank
 * Save.

## Play time!
 * Now that everything is running smoothly, it's play time!
 * We can also deploy a MongoDB Cluster on the X agents you have created.
 * If you want to connect to it from your host, each agent exposes a different port pointing to the port 27017 inside the container. Make sure your `mongod` or `mongos` uses the port 27017 so you can point to it using the port mapped to the host.

# Current Support
* MongoDB 3.6.1
* MongoDB Ops Manager 3.6.1
* The configuration of the backup database and agent seems to work fine.
* The deployment of an entire MongoDB Sharded Cluster works perfectly.

# Connect to any mongodb node with mongo client through Docker
```docker run -it --rm --network netmongo mongo:3.6.1 mongo mongodb-backup:29000```

```docker run -it --rm --network netmongo mongo:3.6.1 mongo agent-1:27000```

