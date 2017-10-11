#!/usr/bin/env bash
docker run -d -p 8080:8080 -h ops-manager --name ops-manager --network netmongo --network-alias ops-manager -e "TERM=dumb" mabeulux88/ops-manager:1.0
