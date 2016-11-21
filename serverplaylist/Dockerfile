FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    echo "Europe/Ljubljana" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    true

# install nodejs deps for development
RUN apt-get install -y wget && \
    cd /tmp && \
    wget https://nodejs.org/dist/v4.2.2/node-v4.2.2-linux-x64.tar.gz && \
    tar -xz --strip-components=1 -C /usr/local/ -f node-v4.2.2-linux-x64.tar.gz && \
# some basic node packages
    npm install -g express && \
    npm install -g express-generator && \
# supervisor
    apt-get install -y pwgen python-setuptools && \
    easy_install supervisor && \
    mkdir -p /var/log/supervisor/ && \
# running static mp3player files
    apt-get install -y apache2 git && \
    rm -rf /var/www && \
    true

ADD . /serverplaylist
RUN cd /serverplaylist && \
    npm install && \
    a2enmod proxy_http && \
    a2enmod rewrite && \
    true

ADD player /var/www/mp3
ADD cfgs/000-default.conf /etc/apache2/sites-enabled/000-default.conf
ADD cfgs/supervisord.conf /etc/supervisord.conf

VOLUME ["/var/www/mp3/music"]
EXPOSE 80
CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
