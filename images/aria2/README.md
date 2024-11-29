## Aria2

## Usage
```bash
docker run -d \
    --name aria2 \
    --hostname aria2 \
    -v $(pwd):/data/downloads \
    -p 6800:6800 \
    -p 6881-6999:6881-6999 \
    ghcr.io/dockenv/aria2:latest
```