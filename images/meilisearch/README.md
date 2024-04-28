## Usage
```bash
docker run -it --rm \
  -p 7700:7700 \
  -v $(pwd)/meili_data:/meili_data \
  -e MEILI_MASTER_KEY='dockenv' \
  ghcr.io/dockenv/meilisearch:latest \
  meilisearch --master-key="dockenv"
```