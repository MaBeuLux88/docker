#!/usr/bin/env bash
docker run -d -h couchbase-beta --name couchbase-beta -p 8091-8094:8091-8094 -p 11210:11210 -v /etc/localtime:/etc/localtime:ro mabeulux88/couchbase-beta:5.0
