FROM alpine:latest

RUN apk add --no-cache wget unzip ca-certificates

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.0/pocketbase_0.22.0_linux_amd64.zip \
    && unzip pocketbase_0.22.0_linux_amd64.zip \
    && rm pocketbase_0.22.0_linux_amd64.zip \
    && chmod +x pocketbase

VOLUME /pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb_data"]
