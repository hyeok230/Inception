FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install nginx openssl
RUN rm /etc/nginx/sites-available/default
COPY conf/nginx.conf /etc/nginx/sites-available/default