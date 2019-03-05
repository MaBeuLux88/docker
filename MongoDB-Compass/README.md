# Docker image for MongoDB Compass.

You must download the MongoDB Compass Beta version and place the deb file in this folder to be able to build this image.

```
wget https://downloads.mongodb.com/compass/beta/mongodb-compass-beta_1.18.0~beta.1_amd64.deb
```

Then you can execute `./docker-build.sh` to build the image.

And finally you can run a container with `./docker-run.sh`.

Note: This container needs access to the X server to instantiate a window in your desktop environment. The command line I provided works for me. Let me know if it doesn't work for you. 
