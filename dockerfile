FROM tomcat:9.0
LABEL description=Final_Tomcat_image
ADD /home/warr/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
