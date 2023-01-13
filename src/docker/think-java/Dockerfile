FROM buildpack-deps:buster-curl as builder

ARG OPEN_JDK_MAJOR_VERSION=3
ARG OPEN_JDK_MINOR_VERSION=15
ARG OPEN_JDK_PATCH_VERSION=3
ARG ARCHITECTURE="aarch64"

# 下载 rootfs 解压到/alpine-minirootfs
RUN set -x \
    && curl -SL --output /var/tmp/openjdk-${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION}_linux-${ARCHITECTURE}_bin.tar.gz https://download.java.net/java/GA/jdk${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION}_linux-${ARCHITECTURE}_bin.tar.gz \
    && mkdir /openjdk-${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION} \
    && tar -xzvf /var/tmp/openjdk-${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION}_linux-${ARCHITECTURE}_bin.tar.gz -C /openjdk-${OPEN_JDK_MAJOR_VERSION}.${OPEN_JDK_MINOR_VERSION}.${OPEN_JDK_PATCH_VERSION} \

# 从零开始
FROM alpine
# 拷贝到容器
COPY --from=builder ["/openjdk-17.0.2", "/"]
# /etc/profile已经添加/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
#ENV
#
CMD ["jshell"]