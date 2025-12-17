## Usage

```bash
docker run -d \
    --name elasticsearch \
    -p 9200:9200 \
    -p 9300:9300 \
    -e "discovery.type=single-node" \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/elastic:latest
```