FROM tomcat:8
#Take the jar and copy to webapps of tomcat
COPY target/*.jar /usr/local/tomcat/webapps/
