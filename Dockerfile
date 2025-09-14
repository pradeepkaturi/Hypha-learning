FROM eclipse-temurin:17-jdk-alpine

COPY java_demo_app-1.0-SNAPSHOT.jar app.jar

EXPOSE 8002

ENTRYPOINT ["java","-jar","/app.jar"]
