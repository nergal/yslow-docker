FROM ubuntu:16.04
RUN apt-get update && apt-get install -y phantomjs libssl1.0.0
WORKDIR /usr/src/app
VOLUME /usr/src/app
