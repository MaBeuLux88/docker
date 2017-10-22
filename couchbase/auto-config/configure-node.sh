#!/usr/bin/env bash
set -m

/entrypoint.sh couchbase-server &

sleep 20

# Setup index and memory quota
curl -X POST http://127.0.0.1:8091/pools/default -d memoryQuota=4000 -d indexMemoryQuota=1000

# Setup services
curl http://127.0.0.1:8091/node/controller/setupServices -d services=kv%2Cn1ql%2Cindex%2Cfts

# Setup credentials
curl http://127.0.0.1:8091/settings/web -d port=8091 -d username=Administrator -d password=couchbase

# Setup Memory Optimized Indexes (forestdb|memory_optimized)
curl -u Administrator:couchbase -X POST http://127.0.0.1:8091/settings/indexes -d 'storageMode=forestdb'

# Creating bucket
curl -u Administrator:couchbase -X POST http://127.0.0.1:8091/pools/default/buckets -d name=my-bucket -d bucketType=couchbase -d ramQuotaMB=4000 -d authType=sasl -d saslPassword=safepassword -d replicaNumber=0 -d flushEnabled=1

sleep 3

# Create index
curl -u Administrator:couchbase -X POST http://127.0.0.1:8091/_p/query/query/service -d 'statement=CREATE INDEX TYPE_INDEX ON `my-bucket`(_class)'

fg 1
