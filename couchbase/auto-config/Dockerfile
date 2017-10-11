FROM couchbase:4.6.0 

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY configure-node.sh /opt/couchbase

CMD ["/opt/couchbase/configure-node.sh"]
