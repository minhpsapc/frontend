# Stage 1: Build Angular application

# Stage 2: Serve Angular application using Nginx
FROM nginx:1.21.0-alpine
COPY ./index.html  /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
