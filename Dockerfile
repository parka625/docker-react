# build phase
FROM node:18-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# path to build files - /app/build

FROM docker.io/nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# default command for an nginx image is to run so don't need to do that here
