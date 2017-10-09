#!/usr/bin/env bash
docker run -d -p 27000:27017 -h mongo-ops --name mongo-ops mongo:3.4.9
