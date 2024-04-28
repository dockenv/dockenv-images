## Usage

```bash
docker run -it --rm \
    -p 9000:9000 \
    -p 9001:9001 \
    ghcr.io/dockenv/minio:latest server /data --console-address ":9001"
```