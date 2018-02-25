FROM docker.elastic.co/elasticsearch/elasticsearch:6.2.1

VOLUME /usr/share/elasticsearch/config
VOLUME /usr/share/elasticsearch/data

WORKDIR /usr/share/elasticsearch

USER 0

RUN elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-hdfs/repository-hdfs-6.2.1.zip
RUN elasticsearch-plugin install --batch https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.1/elasticsearch-analysis-ik-6.2.1.zip

COPY analysis-ik config/analysis-ik
RUN chown -R elasticsearch:0 config

