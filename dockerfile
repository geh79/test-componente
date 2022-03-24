# node
FROM ubi8/nodejs-14 as build-deps
RUN adduser node root
WORKDIR /usr/src/app
RUN chown -R node:node /usr/src/app
RUN chmod -R 775 /usr/src/app

USER 1000
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . ./
RUN npm run build
# nginxRUN adduser node root
FROM registry.access.redhat.com/ubi8/nginx-120
COPY --from=build-deps /usr/src/app/dist /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf