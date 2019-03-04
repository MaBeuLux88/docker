FROM ubuntu:14.04
ADD mongodb-compass_1.17.0_amd64.deb /mongodb-compass.deb
RUN apt-get update && \
    apt-get install -y libgtk-3-0 libsecret-1-0 libgconf-2-4 libx11-xcb-dev libxss1 libnss3 libasound2 && \
    dpkg -i mongodb-compass.deb
CMD ["mongodb-compass"]
