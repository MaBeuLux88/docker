#!/usr/bin/env bash
mkdir -p data
docker run -d -p 28000:28000 -v $(pwd)/data:/data/db -h mongodb-ops --name mongodb-ops --network netmongo --network-alias mongodb-ops mongo:3.4.9 --port=28000
