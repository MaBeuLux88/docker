#!/usr/bin/env bash
docker run -d --rm --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" mabeulux88/mongodb-compass:1.18.0-beta3
