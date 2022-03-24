FROM nginx
WORKDIR /app
COPY . .
COPY ["package.json", "package-lock.json*", "./"]
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./dist /usr/share/nginx/html