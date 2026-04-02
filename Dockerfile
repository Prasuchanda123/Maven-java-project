# Use lightweight Java 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy JAR into container
COPY target/java-docker-app-1.0-SNAPSHOT.jar app.jar

# Run the JAR
ENTRYPOINT ["java","-jar","app.jar"]
