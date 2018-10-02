FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN yarn build

#/app/build <-- all the stuff

FROM nginx
#does nothing on dev machine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
