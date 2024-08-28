# Use an official Tomcat image as a base
FROM tomcat:9.0

# Copy the web application content to Tomcat's webapps directory
COPY ./webapp /usr/local/tomcat/webapps/ROOT/

# Expose port 8080
EXPOSE 8080
