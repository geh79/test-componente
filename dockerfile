# CRA
FROM node:17-alpine as build-deps
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install
COPY . ./
RUN npm run build


FROM nginx
COPY --from=build-deps /usr/src/app/dist /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf