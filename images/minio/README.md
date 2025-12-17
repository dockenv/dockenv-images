## Usage

```bash
docker run -it --rm \
    -p 9000:9000 \
    -p 9001:9001 \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/minio:latest server /data --console-address ":9001"
```