pipeline {
    agent {
        docker {
                    image 'maven:latest'
                    args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
                    }
    }
    stages {
//        stage ('copy source code')
//            steps {
//                git 'https://github.com/evileyedlynx/jenk.git'
//            }
        stage ('build war') {
            steps {
//                    sh 'apt update -y'
//                    sh 'apt install git -y'
                    git 'https://github.com/boxfuse/boxfuse-sample-java-war-hello.git'
                    sh 'mvn package'
                }
        
            }
        stage ('build container') {
            steps {
                sh 'mkdir /home/warr/'
                sh 'cp /target/*.war /home/warr/'
                sh 'docker build -t prod-image https://github.com/evileyedlynx/jenk.git#main'
            }
        }
    }


}