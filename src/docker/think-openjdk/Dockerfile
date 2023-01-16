# 构建镜像 docker build -t hdhxby/think-openjdk:17.0.2 ./
FROM hdhxby/think-alpine
RUN set -x \
    && apk update \
    && apk add openjdk17
CMD ["jshell"]

