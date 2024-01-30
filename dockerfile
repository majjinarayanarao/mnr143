# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Create a directory for Tomcat
RUN mkdir /opt/tomcat

# Set the working directory to /opt/tomcat
WORKDIR /opt/tomcat

# Download and extract Apache Tomcat
RUN apt-get update && apt-get install -y curl && \
    curl -O http://archive.apache.org/dist/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz && \
    tar -xzvf apache-tomcat-9.0.62.tar.gz --strip-components=1 && \
    rm apache-tomcat-9.0.62.tar.gz

# Expose the port that Tomcat will run on
EXPOSE 8080

# Command to run Tomcat
CMD ["bin/catalina.sh", "run"]
