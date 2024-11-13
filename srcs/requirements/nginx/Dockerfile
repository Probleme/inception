FROM	debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl	

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/ataouaf.crt \
       -keyout /etc/nginx/ssl/ataouaf.key \
       -subj "/C=MA/ST=Morocco/L=Morocco/O=1337 School/OU=ataouaf/CN=ataouaf/"

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

CMD [ "nginx", "-g", "daemon off;" ]