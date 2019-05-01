FROM debian:testing
ADD mongodb-compass-beta_1.18.0_beta.3_amd64.deb /mongodb-compass.deb
RUN apt-get update && \
    apt-get install -y libgtk-3-0 libsecret-1-0 libgconf-2-4 libx11-xcb-dev libxss1 libnss3 libasound2 && \
    dpkg -i mongodb-compass.deb
CMD ["mongodb-compass-beta"]
