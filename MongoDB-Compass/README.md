# Docker image for MongoDB Compass.

I'm currently having trouble to run MongoDB Compass natively on my PC because of [this bug](https://jira.mongodb.org/browse/COMPASS-3484).

I created this small Docker image to run MongoDB Compass within an officially supported OS.

To use this image, simply run the following commands: 

```sh
./download-compass.sh
./docker-build.sh
./docker-run.sh
```

When you are done, simply close the MongoDB Compass window and the container will remove itself because of the `--rm` option in the `docker run` command.

Note: This container needs access to the X server to instantiate a window in your desktop environment. The command line I provided works for me. Let me know if it doesn't work for you. 
