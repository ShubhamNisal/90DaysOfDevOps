# stable official Java runtime base image
#FROM openjdk:17-jdk-alpine
FROM eclipse-temurin:17-jdk-alpine

# metadata
LABEL maintainer="your-email@example.com"
LABEL version="1.0"
LABEL description="A simple Java application"

# working directory
WORKDIR /app

# Copy source code into the container
COPY . .

# Compile the Java code
RUN javac Main.java

# Run the Java application when the container starts
CMD ["java", "Main"]
#CMD ["sh", "-c", "java Main; exec tail -f /dev/null"]
