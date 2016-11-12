FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN echo "Europe/Ljubljana" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y install git gcc libglib2.0-dev make screen && \
    git clone https://github.com/predkambrij/streamripper.git /streamripper && \
    cd /streamripper && \
    ./configure && \
    make -j8 && \
    true

VOLUME ["/music", "/radioRipper"]
