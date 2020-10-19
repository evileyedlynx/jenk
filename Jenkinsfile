pipeline {
    agent {
        docker {
                    image 'maven:latest'
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                    }
    }
    stages {
//        stage ('copy source code')
//            steps {
//                git 'https://github.com/evileyedlynx/jenk.git'
//            }
        stage ('build war') {
            steps {
                    sh 'apt update -y'
                    sh 'apt install git -y'
                    sh 'git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git'
                    sh 'mvn package -f /boxfuse-sample-java-war-hello/pom.xml'
                }
        
            }
        stage ('build container') {
            steps {
                sh 'mkdir /home/warr/'
                sh 'cp /boxfuse-sample-java-war-hello/target/*.war /home/warr/'
                sh 'docker build -t prod-image https://github.com/evileyedlynx/jenk.git#main'
            }
        }
    }


}