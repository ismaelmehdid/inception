FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]