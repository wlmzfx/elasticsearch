FROM docker.elastic.co/elasticsearch/elasticsearch:6.4.3

VOLUME /usr/share/elasticsearch/config
VOLUME /usr/share/elasticsearch/data

WORKDIR /usr/share/elasticsearch

USER elasticsearch


COPY --chown=elasticsearch:elasticsearch elasticsearch.yml config/elasticsearch.yml
COPY --chown=elasticsearch:elasticsearch jvm.options config/jvm.options
COPY --chown=elasticsearch:elasticsearch log4j2.properties config/log4j2.properties

RUN elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-hdfs/repository-hdfs-6.4.3.zip
RUN elasticsearch-plugin install --batch https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.4.3/elasticsearch-analysis-ik-6.4.3.zip

COPY --chown=elasticsearch:elasticsearch analysis-ik config/analysis-ik

RUN rm -f *.zip

