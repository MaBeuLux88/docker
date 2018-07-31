#!/usr/bin/env bash
docker network create netcouchbase
docker run -d -h couchbase-cluster-1 --name couchbase-cluster-1 -p 8091-8094:8091-8094 -p 11210:11210 -v /etc/localtime:/etc/localtime:ro --network netcouchbase --network-alias couchbase-cluster-1 couchbase:5.1.0
docker run -d -h couchbase-cluster-2 --name couchbase-cluster-2 -p 8191-8194:8091-8094 -p 11211:11210 -v /etc/localtime:/etc/localtime:ro --network netcouchbase --network-alias couchbase-cluster-2 couchbase:5.1.0
docker run -d -h couchbase-cluster-3 --name couchbase-cluster-3 -p 8291-8294:8091-8094 -p 11212:11210 -v /etc/localtime:/etc/localtime:ro --network netcouchbase --network-alias couchbase-cluster-3 couchbase:5.1.0
