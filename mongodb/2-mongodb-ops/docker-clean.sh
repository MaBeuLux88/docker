#!/usr/bin/env bash
docker stop mongodb-ops
docker rm -v mongodb-ops
rm -rf data 
