FROM node:16-alpine as BASE

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx as SERVER

COPY --from=BASE  /usr/app/build /usr/share/nginx/html
