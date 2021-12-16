# syntax=docker/dockerfile:1

### STAGE 1: Build ###
FROM node:14.15 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

### STAGE 2: Run ###
FROM nginx:1.21.4
# COPY nginx.conf /etc/nginx/nginx.conf  # if you have a special configuration
COPY --from=build /app/dist/demo  /usr/share/nginx/html
