FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.4

MAINTAINER jackkitte

RUN yes | bin/elasticsearch-plugin install analysis-kuromoji
RUN yes | bin/elasticsearch-plugin install analysis-icu

ADD config /usr/share/elasticsearch/config/

ENV ES_JAVA_OPTS "-Xms256m -Xmx256m"
ENV CLUSTER_NAME elasticsearch
ENV NODE_MASTER true
ENV NODE_DATA true
ENV NODE_INGEST true
ENV HTTP_ENABLE true
ENV NETWORK_HOST _site_
ENV HTTP_CORS_ENABLE true
ENV HTTP_CORS_ALLOW_ORIGIN *
ENV NUMBER_OF_MASTERS 1
ENV MAX_LOCAL_STORAGE_NODES 1
ENV SHARD_ALLOCATION_AWARENESS ""
ENV SHARD_ALLOCATION_AWARENESS_ATTR ""
ENV MEMORY_LOCK false
ENV DISCOVERY_SERVICE elasticsearch-discovery
