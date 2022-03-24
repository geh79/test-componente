# node
FROM ubi8/nodejs-14 as build-deps
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . ./
RUN npm run build
# nginx
FROM registry.access.redhat.com/ubi8/nginx-120
COPY --from=build-deps /usr/src/app/dist /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf