#!/usr/bin/env bash
GROUP=***
KEY=***
docker run -d --name mongod1 -h mongod1 -p 27017:27000 mabeulux88/mongodb-agent:1.0 --mmsBaseUrl=http://localhost:8080 --mmsGroupId=$GROUP --mmsApiKey=$KEY
