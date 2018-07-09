#!/usr/bin/env bash
docker run -d -h couchbase --name couchbase -p 8091-8094:8091-8094 -p 11210:11210 -v /etc/localtime:/etc/localtime:ro couchbase:5.1.0
