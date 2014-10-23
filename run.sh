#!/bin/bash

# install configuration
cp $ZK_CONF /opt/zookeeper-3.4.6/conf/zoo.cfg
cp $ZK_LOG_CONF /opt/zookeeper-3.4.6/conf/log4j.properties

# write assigned server id to required myid config file
echo $ZK_SERVER_ID > $ZK_DATADIR/myid

/opt/zookeeper-3.4.6/bin/zkServer.sh start-foreground
