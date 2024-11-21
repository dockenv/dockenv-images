# Bark

## Usage
```bash
docker run -dt \
    --name bark \
    -p 8080:8080 \
    -v `pwd`/bark-data:/data \
    --restart always \
    ghcr.io/dockenv/bark --addr 0.0.0.0:8080 --data /data --dsn=user:pass@tcp(mysql_host)/bark
```