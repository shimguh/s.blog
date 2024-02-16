FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git
RUN apt install cron

RUN rm -rf /var/www
RUN git clone https://github.com/shimguh/s.blog.git /var/www

COPY pull.sh /var/www/
COPY blog-pull-cronjob /etc/cron.d

RUN service cron start

CMD nginx -g 'daemon off;'
