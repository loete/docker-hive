# base image
FROM stfnltnr/hadoop:3.2.0
# Hadoop Version
ARG HIVE_VERSION=3.1.2 
ARG SQL_CONNECTOR_VERSION=5.1.48
# env vars
ENV HIVE_HOME=/opt/hive
# install
RUN wget http://mirror.klaus-uwe.me/apache/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
    tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz && \
    mv apache-hive-$HIVE_VERSION-bin $HIVE_HOME && \
    wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-$SQL_CONNECTOR_VERSION.tar.gz && \
    tar -xzf mysql-connector-java-$SQL_CONNECTOR_VERSION.tar.gz && \
    cp mysql-connector-java-$SQL_CONNECTOR_VERSION/mysql-connector-java-$SQL_CONNECTOR_VERSION.jar $HIVE_HOME/lib/ && \
    echo "PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$HIVE_HOME/bin:$PATH" >> ~/.bashrc && \
    rm -rf apache-hive-$HIVE_VERSION-bin.tar.gz mysql-connector-java-$SQL_CONNECTOR_VERSION mysql-connector-java-$SQL_CONNECTOR_VERSION.tar.gz /var/lib/apt/lists/* /tmp/* /var/tmp/*