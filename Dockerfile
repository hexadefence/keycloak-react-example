FROM node:latest as builder

RUN mkdir /build

WORKDIR /build


COPY  . .

RUN npm run build

FROM nginx:latest

COPY --from=builder /build/build/. /usr/share/nginx/html/
