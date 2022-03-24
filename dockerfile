# node
FROM node:12-alpine as build-deps
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . ./
RUN npm run build
# nginx
FROM nginx:1.20.2-alpine
COPY --from=build-deps /usr/src/app/dist /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf