FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN yarn build

#/app/build <-- all the stuff

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
