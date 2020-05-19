FROM node:12
RUN apt-get update && \
    apt-get install -y libsecret-1-dev && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/mongodb-js/mongosh.git && \
    cd mongosh && \
    npm install -g lerna && \
    npm install -g typescript && \
    npm run bootstrap && \
    npm run compile-exec && \
    cp dist/mongosh /usr/local/bin/. && \
    rm -rf mongosh
ENTRYPOINT ["mongosh"]
