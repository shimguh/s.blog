FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git

COPY . /var/www/html/
COPY blog-pull-cronjob /etc/cron.d

CMD service cron start;["nginx", "-g", "daemon off;"]
