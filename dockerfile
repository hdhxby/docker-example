FROM openjdk:17
#RUN addgroup -S spring && adduser -S spring -G spring
#USER spring:spring
COPY entrypoint.sh entrypoint.sh
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]