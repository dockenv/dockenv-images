# Aerospike

> Aerospike – the reliable, high performance, distributed database optimized for flash and RAM.

## Usage
```bash
docker run -d \
    --name aerospike \
    -v /path/to/conf:/opt/aerospike/etc/ \
    -v /opt/aerospike/data:/opt/aerospike/data \
    -e "FEATURE_KEY_FILE=/opt/aerospike/etc/features.conf" \
    -p 3000-3002:3000-3002 \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/aerospike:ce \
    --config-file /opt/aerospike/etc/aerospike.conf
```

## Advanced Configuration

- `ARANGO_RANDOM_ROOT_PASSWORD` random password
- `SERVICE_ADDRESS` the bind address⁠ of the networking.service subcontext. Default: any
- `SERVICE_PORT` - the port⁠ of the networking.service subcontext. Default: `3000`