#FROM ubuntu:bionic
#LABEL description=Clean_Maven_build
#RUN apt update
#RUN apt install default-jdk -y
#RUN apt install maven -y
#RUN apt install git -y
#RUN mkdir /home/user
#RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/user
#WORKDIR /home/user
#RUN mvn package
FROM nginx
ADD /home/zloben/index.html /usr/share/nginx/html
