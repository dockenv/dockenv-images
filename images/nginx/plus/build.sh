#!/usr/bin/env sh
###
 # @Author: Cloudflying
 # @Date: 2025-03-12 20:59:41
 # @LastEditTime: 2025-03-12 23:48:30
 # @LastEditors: Cloudflying
 # @Description: Build Nginx
###

install_depends()
{
  # Deps
  # libxml2-dev
  # libaio-dev
  # apk add --virtual .deps make gcc g++ autoconf automake git wget findutils
  # apk add sregex-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing


  apk add --no-cache pcre2-dev \
    zlib-dev \
    util-linux-dev \
    openssl-dev curl-dev brotli-dev c-ares-dev jansson-dev cjose-dev apr-dev sqlite-dev apr-util-dev libpq-dev expat-dev libevent-dev libsodium-dev openldap-dev hiredis-dev libmemcached-dev mongo-c-driver-dev apache2-dev check-dev libxslt-dev \
    libxml2-dev gd-dev geoip-dev
    libatomic_ops-dev

  # ./configure: no supported file AIO was found
  apk add --no-cache linux-headers

  # 文件较大
  apk add --no-cache czmq-dev libmaxminddb-dev flex bison zstd-dev libressl-dev

  if [ ! -f "/usr/lib/x86_64-linux-gnu/libssl.a" ]; then
      mkdir -p /usr/lib/x86_64-linux-gnu
      ln -s /usr/lib/libssl.a /usr/lib/x86_64-linux-gnu/libssl.a
      ln -s /usr/lib/libcrypto.a /usr/lib/x86_64-linux-gnu/libcrypto.a
  fi
}

fix_conf()
{
    # 使 Nginx 可以直接使用本地已安装 openssl
    sed -i 's/\.openssl\///g' auto/lib/openssl/conf
    sed -i 's/libssl\.a/x86_64-linux-gnu\/libssl\.a/g' auto/lib/openssl/conf
    sed -i 's/libcrypto\.a/x86_64-linux-gnu\/libcrypto\.a/g' auto/lib/openssl/conf
}


[ ! -d "src/liboauth2" ] && git clone --depth 1 -b v2.1.0 https://github.com/OpenIDC/liboauth2.git ${NGX_MOD_PATH}/liboauth2
# ./configure --prefix=/usr --with-memcache --with-jq --with-redis

fetch_modules()
{
  cd ${NGX_MOD_PATH} || exit 1
  # 2023/1/20
  git clone --depth 1 -b v0.5.2 https://github.com/aperezdc/ngx-fancyindex.git
  # 2023/5
  git clone --depth 1 -b 0.6.0 https://github.com/wandenberg/nginx-push-stream-module.git

  # liboauth2_nginx unknow
  # if [ ! -d "src/ngx_sts_module" ]; then
  #   git clone --depth 1 https://github.com/OpenIDC/ngx_sts_module.git -b v4.0.0 ${NGX_MOD_PATH}/ngx_sts_module
  #   MODULES_OPTS="--add-module=src/ngx_sts_module/src"
  # else
  #   MODULES_OPTS="--add-module=src/ngx_sts_module/src"
  # fi


  # if [ ! -d "src/ngx_oauth2_module" ]; then
  #   git clone --depth 1 https://github.com/OpenIDC/ngx_oauth2_module.git -b 4.0.0 ${NGX_MOD_PATH}/ngx_oauth2_module
  #   MODULES_OPTS="--add-module=src/ngx_oauth2_module/src ${MODULES_OPTS}"
  # else
  #   MODULES_OPTS="--add-module=src/ngx_oauth2_module/src ${MODULES_OPTS}"
  # fi

  # Cache
  # git clone --depth 1 https://github.com/nginx-modules/ngx_cache_purge
  # git clone --depth 1 https://github.com/wandenberg/nginx-selective-cache-purge-module

  # git clone --depth 1 https://github.com/google/nginx-sxg-module
  # git clone --depth 1 https://github.com/openresty/lua-nginx-module

  # 2025/1
  # git clone --depth 1 -b v0.0.16 https://github.com/openresty/stream-lua-nginx-module.git
  # git clone --depth 1 https://github.com/openresty/lua-upstream-nginx-module
  # git clone --depth 1 https://github.com/openresty/echo-nginx-module
  # git clone --depth 1 https://github.com/openresty/stream-echo-nginx-module
  # git clone --depth 1 https://github.com/openresty/set-misc-nginx-module
  # git clone --depth 1 https://github.com/openresty/headers-more-nginx-module
  # git clone --depth 1 https://github.com/openresty/memc-nginx-module
  # git clone --depth 1 https://github.com/openresty/array-var-nginx-module
  # git clone --depth 1 https://github.com/openresty/encrypted-session-nginx-module

  # git clone --depth 1 https://github.com/vision5/ngx_devel_kit
  # git clone --depth 1 https://github.com/vision5/ngx_http_set_lang
  # git clone --depth 1 https://github.com/vision5/ngx_http_set_hash
  # git clone --depth 1 https://github.com/apache/incubator-pagespeed-ngx
  # git clone --depth 1 https://github.com/Refinitiv/nginx-sticky-module-ng
  # git clone --depth 1 https://github.com/arut/nginx-dav-ext-module
  # 流媒体 包含 rtmp 所有功能
  # git clone --depth 1 https://github.com/winshining/nginx-http-flv-module
  # git clone --depth 1 https://github.com/arut/nginx-rtmp-module.git
  # git clone --depth 1 https://github.com/kaltura/nginx-vod-module
  # git clone --depth 1 https://github.com/arut/nginx-live-module

  # MPEG-TS Live
  # git clone --depth 1 https://github.com/arut/nginx-ts-module
  # file unzip
  # git clone --depth 1 https://github.com/ajax16384/ngx_http_untar_module

  # git clone --depth 1 https://github.com/kaltura/nginx-json-var-module
  # git clone --depth 1 https://github.com/nicholaschiasson/ngx_upstream_jdomain
  # git clone --depth 1 https://github.com/itoffshore/nginx-upstream-fair
  # git clone --depth 1 https://github.com/masterzen/nginx-upload-progress-module
  # git clone --depth 1 https://github.com/slact/nchan
  # git clone --depth 1 https://github.com/Lax/traffic-accounting-nginx-module
  # git clone --depth 1 https://github.com/AlticeLabsProjects/nginx-log-zmq
  # unknow error
  # git clone --depth 1 https://github.com/nginx/njs

  # function
  # git clone --depth 1 https://github.com/kaltura/nginx-parallel-module
  # git clone --depth 1 https://github.com/nginx-modules/ngx_http_hmac_secure_link_module

  # Embed language
  # git clone --depth 1 https://github.com/decentfox/nginxpy
  # git clone --depth 1 https://github.com/arut/nginx-python-module
  # git clone --depth 1 https://github.com/rryqszq4/ngx_php7
  # https://github.com/matsumotory/ngx_mruby
  # 2025/2
  # https://github.com/lyokha/nginx-haskell-module

  # Security
  # Application FireWall
  # git clone --depth 1 -b v1.0.3 https://github.com/owasp-modsecurity/ModSecurity-nginx.git
  # git clone --depth 1 https://github.com/aufi/anddos
  # git clone --depth 1 https://github.com/openresty/xss-nginx-module
  # git clone --depth 1 https://github.com/ADD-SP/ngx_waf
  # git clone --depth 1 https://github.com/nbs-system/naxsi

  # server traffic status
  # git clone --depth 1 https://github.com/vozlt/nginx-module-sts
  # git clone --depth 1 https://github.com/vozlt/nginx-module-stream-sts.git # depen by sts
  # git clone --depth 1 https://github.com/psychobilly/ngx_http_json_status_module

  # distributed tracing
  # git clone --depth 1 -b v0.39.0 https://github.com/opentracing-contrib/nginx-opentracing.git

  # Filter
  # git clone --depth 1 https://github.com/openresty/replace-filter-nginx-module
  # git clone --depth 1 https://github.com/yaoweibin/ngx_http_substitutions_filter_module

  # Limit
  # git clone --depth 1 https://github.com/nginx-modules/ngx_http_limit_traffic_ratefilter_module

  # git clone --depth 1 https://github.com/dvershinin/ngx_dynamic_etag.git

  # IP
  # git clone --depth 1 https://github.com/ip2location/ip2proxy-nginx
  # git clone --depth 1 https://github.com/ip2location/ip2location-nginx
  # git clone --depth 1 https://github.com/leev/ngx_http_geoip2_module

  # Proxy
  # 2024/8 A forward proxy module for CONNECT request handling
  # git clone --depth 1 https://github.com/chobits/ngx_http_proxy_connect_module.git


  # Other
  # 2025/2
  # git clone --depth 1 -b 2.3.1 https://github.com/TeslaGov/ngx-http-auth-jwt-module
  # git clone --depth 1 https://github.com/openresty/redis2-nginx-module
  # git clone --depth 1 https://github.com/openresty/rds-csv-nginx-module
  # git clone --depth 1 https://github.com/openresty/rds-json-nginx-module
  # git clone --depth 1 https://github.com/limithit/ngx_dynamic_limit_req_module
  # git clone --depth 1 https://github.com/zhouchangxun/ngx_healthcheck_module
  # git clone --depth 1 https://github.com/tarantool/nginx_upstream_module

  # 2024/11 Async Mode Nginx with QAT support which improves Crypto and compression performance
  # git clone --depth 1 -b v0.5.3 https://github.com/intel/asynch_mode_nginx.git
}

cd ${ROOT_PATH}/nginx || exit 1

./auto/configure \
    --prefix=/usr/local/nginx \
    --sbin-path=/usr/sbin/nginx \
    --modules-path=/usr/local/nginx/modules \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/run/nginx.pid \
    --lock-path=/run/nginx.lock \
    --http-client-body-temp-path=/usr/local/nginx/tmp/client_body \
    --error-log-path=/var/log/nginx.err.log \
    --http-log-path=/var/log/nginx.log \
    --http-proxy-temp-path=/usr/local/nginx/tmp/proxy \
    --http-fastcgi-temp-path=/usr/local/nginx/tmp/fastcgi \
    --http-uwsgi-temp-path=/usr/local/nginx/tmp/uwsgi \
    --http-scgi-temp-path=/usr/local/nginx/tmp/scgi \
    --user=nginx \
    --group=nginx \
    --with-compat \
    --with-file-aio \
    --with-threads \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_dav_module \
    --with-http_degradation_module \
    --with-http_flv_module \
    --with-http_geoip_module=dynamic \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_image_filter_module=dynamic \
    --with-http_mp4_module \
    --with-http_random_index_module \
    --with-http_realip_module \
    --with-http_secure_link_module \
    --with-http_slice_module \
    --with-http_ssl_module \
    --with-http_sub_module \
    --with-http_stub_status_module \
    --with-http_v2_module \
    --with-http_v3_module \
    --with-http_xslt_module=dynamic \
    --with-libatomic \
    --with-mail=dynamic \
    --with-mail_ssl_module \
    --with-poll_module \
    --with-pcre \
    --with-pcre-jit \
    --with-poll_module \
    --with-stream=dynamic \
    --with-stream_geoip_module=dynamic \
    --with-stream_realip_module \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module \
    --with-select_module \
    --with-openssl=/usr \
    ${MODULES_OPTS}