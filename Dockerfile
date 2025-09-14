FROM eclipse-temurin:17-jdk-alpine

COPY /home/runner/work/Hypha-learning/Hypha-learning/java_demo_app/build/libs/*.jar app.jar

EXPOSE 8002

ENTRYPOINT ["java","-jar","/app.jar"]
