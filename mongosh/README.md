# The MongoDB Shell - Docker version

## Install & Update

```shell
docker pull mabeulux88/mongosh:latest
```

## Use it

Create an alias in one of your `.bashrc` or `.bash_aliases` files.

```shell
alias mongosh="docker run -it --rm --network host mabeulux88/mongosh:latest"
```

## Clean it

If you don't want to use this anymore, just remove the alias you created above and remove the docker image from your system.

```shell
docker rmi mabeulux88/mongosh:latest
```

