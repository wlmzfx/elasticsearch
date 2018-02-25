FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.1

VOLUME /usr/share/elasticsearch/config
VOLUME /usr/share/elasticsearch/data

WORKDIR /usr/share/elasticsearch

USER elasticsearch

COPY *.zip ./

RUN elasticsearch-plugin install file://$PWD/repository-hdfs-6.2.1.zip
RUN elasticsearch-plugin install file://$PWD/elasticsearch-analysis-ik-6.2.1.zip

COPY --chown=elasticsearch:elasticsearch analysis-ik config/analysis-ik

RUN rm -f *.zip

