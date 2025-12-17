# Bark

## Usage
```bash
docker run -dt \
    --name bark \
    -p 8080:8080 \
    -v `pwd`/bark-data:/data \
    --restart always \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/bark bark-server --addr 0.0.0.0:8080 --data /data --dsn=user:pass@tcp(mysql_host)/bark
```