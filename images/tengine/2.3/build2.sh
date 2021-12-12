#!/usr/bin/env sh
###
 # @Author: Cloudflying
 # @Date: 2021-11-23 01:57:59
 # @LastEditTime: 2021-11-23 12:31:50
 # @LastEditors: Cloudflying
 # @Description:
 # @FilePath: /dockenv/images/tengine/2.3/build.sh
###
TENGINE_VER='2.3.3'
CORES=$(grep -c 'processor' /proc/cpuinfo)
mkdir -p /tmp/build
cd /tmp/build
if [[ ! -d "/tmp/build/tengine-${TENGINE_VER}" ]]; then
    wget -cq https://tengine.taobao.org/download/tengine-2.3.3.tar.gz
    tar -xvf tengine-${TENGINE_VER}.tar.gz
fi

addgroup -g 101 -S tengine
adduser -S -D -H -u 101 -h /var/cache/tengine -s /sbin/nologin -G tengine -g tengine tengine

# ./configure: no supported file AIO was found
apk add linux-headers
apk add lua5.1-dev luajit-dev pcre-dev libxslt-dev gd-dev geoip-dev libatomic_ops-dev jemalloc-dev libressl-dev

if [[ ! -f "/usr/lib/x86_64-linux-gnu/libssl.a" ]]; then
    mkdir -p /usr/lib/x86_64-linux-gnu
    ln -s /usr/lib/libssl.a /usr/lib/x86_64-linux-gnu/libssl.a
    ln -s /usr/lib/libcrypto.a /usr/lib/x86_64-linux-gnu/libcrypto.a
fi

cd /tmp/build/tengine-${TENGINE_VER}

# 使 Nginx 可以直接使用本地已安装 openssl
# sed -i 's/\.openssl\///g' auto/lib/openssl/conf
# sed -i 's/libssl\.a/x86_64-linux-gnu\/libssl\.a/g' auto/lib/openssl/conf
# sed -i 's/libcrypto\.a/x86_64-linux-gnu\/libcrypto\.a/g' auto/lib/openssl/conf

apk add --no-cache --virtual .build_deps make gcc g++
./configure \
    --prefix=/etc/tengine \
    --sbin-path=/usr/sbin/tengine \
    --modules-path=/usr/lib/tengine/modules \
    --conf-path=/etc/tengine/tengine.conf \
    --error-log-path=/var/log/tengine/error.log \
    --http-log-path=/var/log/tengine/access.log \
    --pid-path=/var/run/tengine.pid \
    --lock-path=/var/run/tengine.lock \
    --http-client-body-temp-path=/var/cache/tengine/client_temp \
    --http-proxy-temp-path=/var/cache/tengine/proxy_temp \
    --http-fastcgi-temp-path=/var/cache/tengine/fastcgi_temp \
    --http-uwsgi-temp-path=/var/cache/tengine/uwsgi_temp \
    --http-scgi-temp-path=/var/cache/tengine/scgi_temp \
    --user=tengine \
    --group=tengine \
    --with-threads \
    --with-file-aio \
    --with-pcre \
    --with-pcre-jit \
    --with-libatomic \
    --with-jemalloc \
    --with-mail \
    --with-mail_ssl_module \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_xslt_module \
    --with-http_image_filter_module \
    --with-http_geoip_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_auth_request_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_degradation_module \
    --with-http_slice_module \
    --with-http_stub_status_module \
    --with-http_lua_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_realip_module \
    --with-stream_geoip_module \
    --with-stream_ssl_preread_module \
    --with-stream_sni \
    --with-luajit-inc=/usr/include/luajit-2.1 \
    --with-luajit-lib=/usr/lib \
    --with-lua-inc=/usr/include \
    --with-lua-lib=/usr/lib

make -j${CORES}
make install

# --with-openssl=/usr \
# --with-zlib=/usr \
apk del .build_deps
