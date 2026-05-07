FROM alpine:latest

RUN apk add --no-cache wget unzip ca-certificates

# Download PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.0/pocketbase_0.22.0_linux_amd64.zip \
    && unzip pocketbase_0.22.0_linux_amd64.zip \
    && rm pocketbase_0.22.0_linux_amd64.zip \
    && chmod +x pocketbase

# Render sets PORT env variable — PocketBase must listen on it
ENV PORT=8090

EXPOSE $PORT

# Use shell form so $PORT is expanded at runtime
CMD ./pocketbase serve --http=0.0.0.0:$PORT --dir=/pb_data