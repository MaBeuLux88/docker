#!/usr/bin/env bash
if [ "$#" -ne 4 ]; then
    echo "Illegal number of parameters"
    echo "Usage : $0 quantityAgents mmsBaseUrl mmsGroupId mmsApiKey"
    exit 1
fi

N=$1
URL=$2
GROUP=$3
KEY=$4

echo "Creating $N Agents with mmsBaseUrl=$URL mmsGroupId=$GROUP and mmsApiKey=$KEY."

for i in `seq 1 $N`;
do
  docker run -d --network netmongo --network-alias agent-$i --name agent-$i -h agent-$i -p $((27016+$i)):27017 mabeulux88/mongodb-agent:1.0 --mmsBaseUrl=$URL --mmsGroupId=$GROUP --mmsApiKey=$KEY
done
