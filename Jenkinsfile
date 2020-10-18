pipeline {
    agent any
    stages {
        stage ('build the artifact') {
            agent docker {
                    image "tomcat:9.0"
                    args "-v /var/run/docker.sock:/var/run/docker.sock"
                    label "myimg"
                }
                steps {
                    sh 'apt update -y'
                    sh 'apt install git -y'
                    sh 'apt install maven -y'
                    sh 'git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git'
                    sh 'mvn package -f /boxfuse-sample-java-war-hello/pom.xml'
                    sh 'cp boxfuse-sample-java-war-hello/target/*.war /usr/local/tomcat/webapps/'
                    sh 'run catalina.sh'

                }
            }
        }

    }   
