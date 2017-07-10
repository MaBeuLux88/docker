#!/usr/bin/env bash
set -m

/entrypoint.sh couchbase-server &

sleep 20

# Setup index and memory quota
curl -X POST http://127.0.0.1:8091/pools/default -d memoryQuota=500 -d indexMemoryQuota=500

# Setup services
curl http://127.0.0.1:8091/node/controller/setupServices -d services=kv%2Cn1ql%2Cindex

# Setup credentials
curl http://127.0.0.1:8091/settings/web -d port=8091 -d username=Administrator -d password=couchbase

# Setup Memory Optimized Indexes
curl -u Administrator:couchbase -X POST http://127.0.0.1:8091/settings/indexes -d 'storageMode=memory_optimized'

# Creating bucket
curl -u Administrator:couchbase -X POST http://127.0.0.1:8091/pools/default/buckets -d name=sekai -d bucketType=couchbase -d ramQuotaMB=500 -d authType=sasl -d saslPassword=sekai -d replicaNumber=0 -d flushEnabled=1

sleep 3

# Create index
curl -u Administrator:couchbase -X POST http://127.0.0.1:8091/_p/query/query/service -d 'statement=CREATE INDEX TYPE_INDEX ON sekai(_class)'

fg 1
