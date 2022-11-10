FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install nginx openssl
RUN rm /etc/nginx/sites-available/default
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.key -out /etc/ssl/certs/server.crt -subj "/C=KR/ST=Seoul/L=Gangnam/O=42Seoul/OU=solo/CN=junylee"
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]