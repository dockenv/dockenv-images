# hadolint ignore=DL3007
FROM couchbase:latest
LABEL org.opencontainers.image.title="Couchbase" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Couchbase Server is a NoSQL document database with a distributed architecture.'

VOLUME /opt/couchbase/var

# 8091: Cluster administration REST/HTTP traffic, including Couchbase Web Console
# 8092: Views and XDCR access
# 8093: Query service REST/HTTP traffic
# 8094: Search Service REST/HTTP traffic
# 8095: Analytics service REST/HTTP traffic
# 8096: Eventing service REST/HTTP traffic
# 8097: Backup service REST/HTTP traffic
# 9123: Analytics prometheus
# 11207: Data Service (SSL)
# 11210: Data Service
# 11280: Data Service prometheus
# 18091: Cluster administration REST/HTTP traffic, including Couchbase Web Console (SSL)
# 18092: Views and XDCR access (SSL)
# 18093: Query service REST/HTTP traffic (SSL)
# 18094: Search Service REST/HTTP traffic (SSL)
# 18095: Analytics service REST/HTTP traffic (SSL)
# 18096: Eventing service REST/HTTP traffic (SSL)
# 18097: Backup service REST/HTTP traffic (SSL)
EXPOSE 8091 \
       8092 \
       8093 \
       8094 \
       8095 \
       8096 \
       8097 \
       9123 \
       11207 \
       11210 \
       11280 \
       18091 \
       18092 \
       18093 \
       18094 \
       18095 \
       18096 \
       18097

CMD ["couchbase-server"]