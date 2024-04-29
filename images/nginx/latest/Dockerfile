FROM ghcr.io/dockenv/alpine:latest

LABEL org.opencontainers.image.title="Nginx" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.description='Nginx latest'

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
            nginx-mod-http-lua \
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
            && rm -fr /etc/nginx/nginx.conf \
            && rm -fr /etc/nginx/http.d \
            && rm -fr /etc/nginx/conf.d/* \
            && mkdir -p /tmp/nginx/proxy_temp_dir /tmp/nginx/proxy_cache_dir

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d
COPY conf/dh2048.pem /etc/nginx/dh2048.pem
COPY conf/fastcgi_params /etc/nginx/fastcgi_params
COPY conf/index.html /var/www/

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
