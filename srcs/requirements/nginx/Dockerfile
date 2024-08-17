FROM	debian:bullseye

# Install Nginx and OpenSSL
RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

# Generate self-signed SSL certificate (consider using a CA for production)
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/ataouaf.crt \
       -keyout /etc/nginx/ssl/ataouaf.key \
       -subj "/C=MA/ST=Morocco/L=Morocco/O=1337 School/OU=ataouaf/CN=ataouaf/"

# Copy Nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

CMD [ "nginx", "-g", "daemon off;" ]