#!/usr/bin/env bash
mkdir -p data
docker run -d -p 29000:29000 -v $(pwd)/data:/data/db -u 1000:1000 -h mongodb-backup --name mongodb-backup --network netmongo --network-alias mongodb-backup mongo:3.6.1 --port=29000 --bind_ip_all
