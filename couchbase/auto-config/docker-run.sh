#!/usr/bin/env bash
docker run -d -p 8091-8094:8091-8094 -p 11210:11210 -v /etc/localtime:/etc/localtime:ro -h autoconfig-couchbase --name autoconfig-couchbase mabeulux88/autoconfig-couchbase:4.6.3
