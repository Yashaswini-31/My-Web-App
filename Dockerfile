# Use an official Maven image to build the application
FROM maven:3.8.1-openjdk-17-slim AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven pom.xml and the source code to the container
COPY pom.xml .
COPY src ./src

# Run Maven to build the application
RUN mvn clean install

# Use a smaller base image to run the Java application
FROM openjdk:17-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built jar file from the builder stage
COPY --from=builder /app/target/my-web-app.jar /app/my-web-app.jar

# Expose the port the app will run on
EXPOSE 8080

# Run the Java application
ENTRYPOINT ["java", "-jar", "/app/my-web-app.jar"]
