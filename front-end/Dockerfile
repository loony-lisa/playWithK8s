FROM nginx:latest
COPY ./front-end.com /etc/nginx/sites-available/
COPY ./nginx.conf /etc/nginx/
COPY ./index.html /var/www/html/
#COPY ./index.html /usr/share/nginx/html/
EXPOSE 8080
EXPOSE 80
RUN mkdir /etc/nginx/sites-enabled; \
    ln -s /etc/nginx/sites-available/front-end.com /etc/nginx/sites-enabled/front-end.com
ENTRYPOINT ["nginx", "-g", "daemon off;"]