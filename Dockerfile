FROM golang:1.8.0-alpine
ADD . /go/src/github.com/phuslu/server.php-go
WORKDIR /go/src/github.com/phuslu/server.php-go
RUN apk update && \
    env CGO_ENABLED=0 \
    go build -v -ldflags="-s -w" -o /goproxy-php

FROM alpine
COPY --from=0 /goproxy-php /goproxy-php
ENTRYPOINT /goproxy-php
