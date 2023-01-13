# 构建镜像 docker build -t hdhxby/think-openjdk:17.0.2 ./
FROM buildpack-deps:buster-curl as builder

ARG OPEN_JDK_MAJOR_VERSION=17
ARG OPEN_JDK_MINOR_VERSION=0
ARG OPEN_JDK_PATCH_VERSION=2
ARG ARCHITECTURE="aarch64"

# 下载 openjdk 解压到/openjdk
RUN set -x \
    && curl -SL --output /var/tmp/openjdk.tar.gz https://download.java.net/java/GA/jdk${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION}_linux-${ARCHITECTURE}_bin.tar.gz \
    && mkdir /openjdk \
    && tar -xzvf /var/tmp/openjdk.tar.gz -C /openjdk
# 从零开始
FROM oraclelinux:8-slim
# 拷贝到容器
COPY --from=builder ["/openjdk", "/opt"]
ENV JAVA_HOME=/opt/jdk-17.0.2
ENV PATH=$PATH:$JAVA_HOME/bin
#
CMD ["jshell"]