# Stage 1: Build Angular application
FROM node:14.17.6 AS build
WORKDIR ./
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build -- --prod

# Stage 2: Serve Angular application using Nginx
FROM nginx:1.21.0-alpine
COPY --from=build ./dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]