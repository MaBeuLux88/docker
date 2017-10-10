#!/usr/bin/env bash

/opt/mongodb/mms/bin/mongodb-mms start

# trick to keep container alive until the mongodb-mms process dies.
pgrep mms-app 1> /dev/null
until [ $? -ne 0 ]
do
  sleep 10
  pgrep mms-app 1> /dev/null
done
