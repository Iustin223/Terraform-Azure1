FROM nginx:latest

COPY ./site-content /usr/share/nginx/html

EXPOSE 80