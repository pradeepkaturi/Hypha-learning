FROM eclipse-temurin:17-jdk-alpine

ARG JAR_FILE=java_demo_app/build/libs/*.jar
COPY ${JAR_FILE} app.jar

EXPOSE 8002

ENTRYPOINT ["java","-jar","/app.jar"]
