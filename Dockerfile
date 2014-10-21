FROM ubuntu:14.04
MAINTAINER Chelsea Zhang <chelsea@bluelabs.com>

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt
RUN mkdir -p /tmp/zookeeper

ENV ZK_CONF /opt/zookeeper-3.4.6/conf/zoo_sample.cfg

ENV ZK_SERVER_ID 1

# ZK_DATADIR should be dataDir from zookeeper config
ENV ZK_DATADIR /tmp/zookeeper

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper-3.4.6

VOLUME ["/opt/zookeeper-3.4.6/conf", "/tmp/zookeeper"]

ADD run.sh /usr/local/bin/run

CMD ["/usr/local/bin/run"]
