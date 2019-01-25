FROM node:alpine

WORKDIR /app

RUN apk add --no-cache \
        bash \
        git \
        shadow \
        su-exec \
    # build tools
    && apk --no-cache add \
        g++ \
        libpng-dev \
        make \
        zlib-dev \
    && rm -fr /var/cache/apk/*

RUN adduser -D -u 1337 developer && deluser --remove-home node

COPY entrypoint /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]
