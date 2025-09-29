# Use Tomcat 10 with JDK 17
FROM tomcat:10.1-jdk17-openjdk

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the application as ROOT application (so it's accessible at /)
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Create WEB-INF/lib directory if it doesn't exist
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/lib

# Set proper permissions
RUN chmod -R 755 /usr/local/tomcat/webapps/

# Set environment variables for OnRender
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# Expose port (OnRender will bind to PORT environment variable)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]