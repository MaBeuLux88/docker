#!/usr/bin/env bash
mkdir data
docker run -d -p 29000:29000 -v $(pwd)/data:/data/db -h mongodb-backup --name mongodb-backup --network netmongo --network-alias mongodb-backup mongo:3.4.9 --port=29000
