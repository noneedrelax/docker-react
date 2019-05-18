FROM node:alpine as buildNode

WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build

FROM nginx as serverNode
EXPOSE 80
COPY --from=buildNode /app/build /usr/share/nginx/html
