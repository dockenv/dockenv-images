## Usage
```bash
docker run -it --rm \
  -p 7700:7700 \
  -v $(pwd)/meili_data:/meili_data \
  -e MEILI_MASTER_KEY='dockenv' \
  swr.ap-southeast-3.myhuaweicloud.com/dockenv/meilisearch:latest \
  meilisearch --master-key="dockenv"
```