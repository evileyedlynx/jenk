FROM tomcat:9.0
LABEL description=Final_Tomcat_image
ADD boxfuse-sample-java-war-hello boxfuse-sample-java-war-hello
RUN cp home/warr/target/*.war /usr/local/tomcat/webapps/
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["catalina.sh", "run"]
