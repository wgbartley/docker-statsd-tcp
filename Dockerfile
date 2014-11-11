FROM phusion/baseimage:latest

RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN apt-get -y update && apt-get -y install git nodejs supervisor


# logging support
RUN mkdir -p /var/log/supervisor


# install statsd
RUN git clone https://github.com/etsy/statsd.git /opt/statsd
ADD conf/config.js /opt/statsd/config.js


# daemons and startup
ADD conf/statsd.conf /etc/supervisor/conf.d/statsd.conf
ADD con/start.sh /start.sh

RUN chmod +x /start.sh


# defaults
EXPOSE 8125/tcp 8126/tcp

WORKDIR /
ENV HOME /root

CMD ["/start.sh"]
