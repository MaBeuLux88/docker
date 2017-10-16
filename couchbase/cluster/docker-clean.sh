#!/usr/bin/env bash
docker stop couchbase-cluster-1
docker stop couchbase-cluster-2
docker stop couchbase-cluster-3
docker rm -v couchbase-cluster-1
docker rm -v couchbase-cluster-2
docker rm -v couchbase-cluster-3
docker network rm netcouchbase
exit 0
