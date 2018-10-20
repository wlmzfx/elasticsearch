FROM docker.elastic.co/elasticsearch/elasticsearch:6.4.2

VOLUME /usr/share/elasticsearch/config
VOLUME /usr/share/elasticsearch/data

WORKDIR /usr/share/elasticsearch

USER elasticsearch

COPY *.zip ./

COPY --chown=elasticsearch:elasticsearch elasticsearch.yml config/elasticsearch.yml
COPY --chown=elasticsearch:elasticsearch jvm.options config/jvm.options
COPY --chown=elasticsearch:elasticsearch log4j2.properties config/log4j2.properties

RUN elasticsearch-plugin install https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-hdfs/repository-hdfs-6.4.2.zip
RUN elasticsearch-plugin install file://$PWD/elasticsearch-analysis-ik-6.4.2.zip

COPY --chown=elasticsearch:elasticsearch analysis-ik config/analysis-ik

RUN rm -f *.zip

