# MongoDB Ops Manager
The point of this folder is to be able to mount an entire MongoDB Ops Manager cluster within docker containers.

# Current Support
* MongoDB 3.4.9
* MongoDB Ops Manager 3.4.9
* The configuration of the backup database and agent seems to work fine.
* The deployment of an entire MongoDB Sharded Cluster works perfectly.

# Connect to a mongodb node with mongo client
`docker run -it --rm --network netmongo mongo:3.4.9 mongo mongodb-backup:29000`
