## Usage

```bash
docker run -d \
    -v $PWD/Caddyfile:/etc/caddy/Caddyfile\
    -v $PWD/site/index.html:/usr/share/caddy/index.html \
    -v caddy_data:/data \
    -v caddy_config:/config \
    -p 80:80 \
    -p 443:443 \
    -p 443:443/udp \
    ghcr.io/dockenv/caddy:latest
```