# Use Tomcat 10 with JDK 17
FROM tomcat:10.1-jdk17-openjdk

# Remove default ROOT application but keep manager apps
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the application to ch09_ex2_cart context path (same as local)
COPY web/ /usr/local/tomcat/webapps/ch09_ex2_cart/

# Create ROOT application with redirect
RUN mkdir -p /usr/local/tomcat/webapps/ROOT
COPY web/root_redirect.html /usr/local/tomcat/webapps/ROOT/index.html

# Create WEB-INF/lib directory if it doesn't exist
RUN mkdir -p /usr/local/tomcat/webapps/ch09_ex2_cart/WEB-INF/lib

# Set proper permissions
RUN chmod -R 755 /usr/local/tomcat/webapps/

# Set environment variables for OnRender
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]