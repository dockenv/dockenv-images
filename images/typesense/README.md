# Typesense

## Run Params

```bash
export TYPESENSE_API_KEY=xxx
docker run -p 8108:8108 \
    -v"$(pwd)":/data \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/typesense:28.0 \
    --data-dir /data \
    --api-key=$TYPESENSE_API_KEY \
    --enable-cors
```