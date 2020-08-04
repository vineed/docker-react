#build phase
FROM node:alpine as build

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#run phase (prod)
FROM nginx

COPY --from=build  /app/build /usr/share/nginx/html

#no run command nginx start automatically




