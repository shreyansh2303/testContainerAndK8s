# ==========================================
# STAGE 1: Build the application
# ==========================================
# Use a heavier image that includes Maven to build the code
FROM maven:3.9.6-eclipse-temurin-21-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Run Maven to compile the code and create the .jar file
# (This happens completely inside the Docker build process)
RUN mvn clean package -DskipTests

# ==========================================
# STAGE 2: Run the application
# ==========================================
# Use a lightweight image just for running the app
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copy ONLY the built .jar file from the "builder" stage above
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]