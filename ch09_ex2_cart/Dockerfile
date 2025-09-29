# Use Tomcat 10 with JDK 17
FROM tomcat:10.1-jdk17-openjdk

# Remove default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the application to webapps directory
COPY web/ /usr/local/tomcat/webapps/ch09_ex2_cart/

# Copy JSTL libraries (if needed in future)
RUN mkdir -p /usr/local/tomcat/webapps/ch09_ex2_cart/WEB-INF/lib

# Set proper permissions
RUN chmod -R 755 /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]