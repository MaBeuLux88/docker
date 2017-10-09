FROM ubuntu:16.04
COPY mongodb-mms_3.4.9.511-1_x86_64.deb /tmp/mongodb-mms_3.4.9.511-1_x86_64.deb
RUN apt-get update && \
    apt-get install -y openssl net-tools && \
    dpkg -i /tmp/mongodb-mms_3.4.9.511-1_x86_64.deb && \
    rm -rf /var/lib/apt/lists/* /tmp/*
COPY conf-mms.properties /opt/mongodb/mms/conf/conf-mms.properties
CMD ["/opt/mongodb/mms/bin/mongodb-mms","start"]
