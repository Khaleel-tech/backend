# FROM openjdk:17-jdk-alpine
# WORKDIR /app
# COPY target/ride_fast_backend-0.0.1-SNAPSHOT.jar /app/ride-fast-backend.jar
# EXPOSE 8080
# CMD [ "java", "-jar","ride-fast-backend.jar" ]

# STEP 1: Build JAR file
FROM maven:3.8.7-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# STEP 2: Run the app
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/ride_fast_backend-0.0.1-SNAPSHOT.jar ride-fast-backend.jar
EXPOSE 8080
CMD ["java", "-jar", "ride-fast-backend.jar"]
