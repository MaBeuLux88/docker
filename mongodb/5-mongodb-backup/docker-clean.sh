#!/usr/bin/env bash
docker stop mongodb-backup
docker rm -v mongodb-backup
rm -rf data 
exit 0
