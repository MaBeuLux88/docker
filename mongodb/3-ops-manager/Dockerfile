FROM debian:9.5
COPY mongodb-mms_4.0.1.50101.20180801T1119Z-1_x86_64.deb /tmp/mongodb-mms_4.0.1.50101.20180801T1119Z-1_x86_64.deb
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && \
    apt-get install -y openssl net-tools procps && \
    dpkg -i /tmp/mongodb-mms_4.0.1.50101.20180801T1119Z-1_x86_64.deb && \
    sed -i 's/127.0.0.1:27017/mongodb-ops:28000/' /opt/mongodb/mms/conf/conf-mms.properties && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    mkdir /backup /head && \
    chown mongodb-mms:mongodb-mms /backup /head && \
    chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
