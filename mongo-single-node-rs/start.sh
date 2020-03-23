#!/usr/bin/env bash
docker-compose up -d
sleep 3
docker exec -it mongo-single-node-rs_mongo_1 mongo
