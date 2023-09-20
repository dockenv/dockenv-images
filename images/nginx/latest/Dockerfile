FROM ghcr.io/dockenv/alpine:latest

LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk" \
        org.opencontainers.image.description="nginx latest version"

RUN apk add --no-cache nginx \
            nginx-mod-http-brotli \
            nginx-mod-http-auth-jwt \
            nginx-mod-http-cache-purge \
            nginx-mod-http-cookie-flag \
            nginx-mod-http-dav-ext \
            nginx-mod-http-encrypted-session \
            nginx-mod-http-fancyindex \
            nginx-mod-http-geoip \
            nginx-mod-http-geoip2 \
            nginx-mod-http-headers-more \
            nginx-mod-http-image-filter \
            nginx-mod-http-js \
            nginx-mod-http-naxsi \
            nginx-mod-http-nchan \
            nginx-mod-http-redis2 \
            nginx-mod-http-set-misc \
            nginx-mod-http-vod \
            nginx-mod-http-vts \
            nginx-mod-mail \
            nginx-mod-rtmp \
            nginx-mod-stream \
            nginx-mod-stream-geoip \
            nginx-mod-stream-geoip2 \
            tzdata \
            && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
            && echo "Asia/Shanghai" > /etc/timezone \
            rm -fr /etc/nginx/nginx.conf

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/dh2048.pem /etc/nginx/dh2048.pem
COPY conf/rewrite /etc/nginx/rewrite

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
