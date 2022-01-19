# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "Irfan Shaikh"
COPY /opt/docker_project/docker-images/hello-world/webapp.war /usr/local/tomcat/webapps
