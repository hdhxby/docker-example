# 构建镜像 docker build -t hdhxby/think-apline:3.15.3 ./
FROM buildpack-deps:buster-curl as builder

ARG ALPINE_MAJOR_VERSION=3
ARG ALPINE_MINOR_VERSION=15
ARG ALPINE_PATCH_VERSION=3
ARG ARCHITECTURE="aarch64"

# 下载 rootfs 解压到/alpine-minirootfs
RUN set -x \
    && curl -SL --output /var/tmp/alpine-minirootfs.tar.gz https://dl-cdn.alpinelinux.org/alpine/v${ALPINE_MAJOR_VERSION}.${ALPINE_MINOR_VERSION}/releases/aarch64/alpine-minirootfs-${ALPINE_MAJOR_VERSION}.${ALPINE_MINOR_VERSION}.${ALPINE_PATCH_VERSION}-${ARCHITECTURE}.tar.gz \
    && mkdir /alpine-minirootfs \
    && tar -xzvf /var/tmp/alpine-minirootfs.tar.gz -C /alpine-minirootfs

# 从零开始
FROM --platform=linux/arm64 scratch

# 拷贝到容器
COPY --from=builder ["/alpine-minirootfs", "/"]
# /etc/profile已经添加/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
#ENV
#
CMD ["/bin/sh"]