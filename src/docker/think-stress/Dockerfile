# 构建镜像 docker build -t hdhxby/think-stress ./
FROM hdhxby/think-alpine
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]