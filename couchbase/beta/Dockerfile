FROM debian:8.8
ADD couchbase-server-enterprise_5.0.0-debian8_amd64.deb /
ADD scripts/entrypoint.sh /
ADD scripts/run /etc/service/couchbase-server/run
RUN chmod u+x /entrypoint.sh /etc/service/couchbase-server/run && \
    groupadd -g 1000 couchbase && useradd couchbase -u 1000 -g couchbase -M && \
    apt-get update && \
    apt-get install -yq libssl1.0.0 runit lsof lshw sysstat net-tools numactl python-httplib2 && \
    dpkg -i /couchbase-server-enterprise_5.0.0-debian8_amd64.deb && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV PATH=$PATH:/opt/couchbase/bin:/opt/couchbase/bin/tools:/opt/couchbase/bin/install
EXPOSE 8091 8092 8093 8094 11207 11210 11211 18091 18092 18093
VOLUME /opt/couchbase/var
ENTRYPOINT ["/entrypoint.sh"]
CMD ["couchbase-server"]
