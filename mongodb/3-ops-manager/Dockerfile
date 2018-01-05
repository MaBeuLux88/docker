FROM ubuntu:16.04
COPY mongodb-mms_3.6.1.591-1_x86_64.deb /tmp/mongodb-mms_3.6.1.591-1_x86_64.deb
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && \
    apt-get install -y openssl net-tools && \
    dpkg -i /tmp/mongodb-mms_3.6.1.591-1_x86_64.deb && \
    sed -i 's/127.0.0.1:27017/mongodb-ops:28000/' /opt/mongodb/mms/conf/conf-mms.properties && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    mkdir /backup && \
    chown mongodb-mms:mongodb-mms /backup && \
    chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
