#!/usr/bin/env bash
docker run -d -p 8091-8094:8091-8094 -p 11210:11210 -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -h couchbaseTest --name couchbaseTest mabeulux88/couchbase:4.6.0
