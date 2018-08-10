FROM debian:9.5
COPY mongodb-mms-automation-agent-manager_5.4.9.5483-1_amd64.ubuntu1604.deb /tmp/mongodb-mms-automation-agent-manager_5.4.9.5483-1_amd64.ubuntu1604.deb
RUN apt-get update && \
    apt-get install -y openssl ca-certificates libsasl2-2 procps && \
    dpkg -i /tmp/mongodb-mms-automation-agent-manager_5.4.9.5483-1_amd64.ubuntu1604.deb && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    mkdir /data && \
    chown mongodb:mongodb /data
ENTRYPOINT ["/opt/mongodb-mms-automation/bin/mongodb-mms-automation-agent"]
