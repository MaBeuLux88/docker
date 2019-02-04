#!/usr/bin/env bash
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" mabeulux88/mongodb-compass:1.16.3
