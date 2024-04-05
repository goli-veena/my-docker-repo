FROM httpd:latest
MAINTAINER veena
WORKDIR /var/www/html
COPY ./public/index.html /var/www/html

CMD ["httpd", "-D", "FOREGROUND"]
