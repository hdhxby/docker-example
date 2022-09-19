FROM amd64/buildpack-deps as builder

ARG KAFKA_VERSION=3.1.0
ARG SCALA_VERSION=2.13

# 需要先解压出来
RUN set -x \
    && curl -SL --output /var/tmp/kafka.tgz https://dlcdn.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && mkdir /kafka \
    && tar -xzvf /var/tmp/kafka.tgz -C /kafka

FROM openjdk
COPY --from=builder ["/kafka", "/opt"]
RUN sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper:2181/g' /opt/kafka_2.13-3.1.0/config/server.properties
CMD ["/opt/kafka_2.13-3.1.0/bin/kafka-server-start.sh","/opt/kafka_2.13-3.1.0/config/server.properties"]
