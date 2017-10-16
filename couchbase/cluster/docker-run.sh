#!/usr/bin/env bash
docker run -d -h couchbase-cluster-1 --name couchbase-cluster-1 -p 7091-7094:8091-8094 -p 11210:11210 -v /etc/localtime:/etc/localtime:ro --network netcouchbase --network-alias couchbase-cluster-1 couchbase:4.6.3
docker run -d -h couchbase-cluster-2 --name couchbase-cluster-2 -p 8091-8094:8091-8094 -p 21210:11210 -v /etc/localtime:/etc/localtime:ro --network netcouchbase --network-alias couchbase-cluster-2 couchbase:4.6.3
docker run -d -h couchbase-cluster-3 --name couchbase-cluster-3 -p 9091-9094:8091-8094 -p 31210:11210 -v /etc/localtime:/etc/localtime:ro --network netcouchbase --network-alias couchbase-cluster-3 couchbase:4.6.3
