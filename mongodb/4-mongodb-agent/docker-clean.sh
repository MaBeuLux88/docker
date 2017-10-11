#!/usr/bin/env bash
docker ps -q --filter name="agent" | xargs docker stop | xargs docker rm -v 
exit 0
