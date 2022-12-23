# docker-example
> docker的使用个方式
## 制作docker镜像
### 镜像列表
#### thinkalpine
rootfs,根文件系统

#### stress
压力测试

## spring boot

[spring-boot-docker](https://spring.io/guides/gs/spring-boot-docker "spring-boot-docker")

### FatJar
> 简单构建
Dockerfile
```dockerfile
FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```
构建
```shell
docker build -t springio/gs-spring-boot-docker .
```

### 分层镜像
> 缓存层,快速构建

复制文件到target/dependency目录下
```shell
mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)
```

Dockerfile
```dockerfile
FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]
```
构建
```shell
docker build -t springio/gs-spring-boot-docker .
```
### maven插件

#### jib-maven-plugin
```xml
<plugin>
    <groupId>com.google.cloud.tools</groupId>
    <artifactId>jib-maven-plugin</artifactId>
    <version>${jib-maven-plugin.version}</version>
</plugin>
```

#### spring boog Plugin
```xml
<plugin>
    <groupId>com.google.cloud.tools</groupId>
    <artifactId>jib-maven-plugin</artifactId>
</plugin>
```
profile
```shell
./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=springio/gs-spring-boot-docker
```
debug
```shell
docker run -e "SPRING_PROFILES_ACTIVE=prod" -p 8080:8080 -t springio/gs-spring-boot-docker
```

```shell
docker run -e "JAVA_TOOL_OPTIONS=-agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n" -p 8080:8080 -p 5005:5005 -t springio/gs-spring-boot-docker
```