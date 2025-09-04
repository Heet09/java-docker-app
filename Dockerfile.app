# Dockerfile.app
FROM 815254799750.dkr.ecr.us-east-1.amazonaws.com/base-java17:latest
WORKDIR /app
COPY target/demo-0.0.1-SNAPSHOT.jar ./demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]