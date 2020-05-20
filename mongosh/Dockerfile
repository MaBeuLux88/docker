FROM debian:latest
RUN apt-get update && apt-get install -y wget && \
    wget -O - https://github.com/mongodb-js/mongosh/releases/download/v0.0.1-alpha.17/mongosh-0.0.1-alpha.17-linux.tgz | tar -C /usr/local/bin -xzf - && \
    apt-get remove --purge -y wget && apt-get autoclean -y && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["mongosh"]

