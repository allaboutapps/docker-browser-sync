FROM node:14-alpine as builder
RUN npm -g install browser-sync@v2.26.14
WORKDIR /source

FROM gcr.io/distroless/nodejs:14
COPY --from=builder /usr/local/lib/node_modules/browser-sync /app
WORKDIR /app/dist
ENTRYPOINT ["/nodejs/bin/node", "bin.js"]