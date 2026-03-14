## Vaultwarden

An alternative server implementation of the Bitwarden Client API, written in Rust and compatible with official Bitwarden clients [disclaimer], perfect for self-hosted deployment where running the official resource-heavy service might not be ideal.

## Usage

```bash
docker pull ghcr.io/dockenv/vaultwarden:latest
docker run --detach --name vaultwarden \
  --env DOMAIN="https://vw.domain.tld" \
  --volume /vw-data/:/data/ \
  --restart unless-stopped \
  --publish 127.0.0.1:10801:80 \
  ghcr.io/dockenv/vaultwarden:latest
```