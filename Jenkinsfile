pipeline {
    agent any
//    tools {
//        docker "dock1"
//        }
    stages {
        stage ('build the artifact') {
            withDockerContainer(args: '-p 8123:8123 -it --privileged --name buidock', image: 'docker:dind') {
                withDockerRegistry(credentialsId: 'bd62d3cc-68eb-477b-bd16-ac0fef201d85', url: '46.151.9.165:8123') {
                    steps {
                        // where do Git clone its repo? I need that in /home/warr of Builder, or /home/maven in Maven container! Found $WORKSPACE. Dunno.
                        git credentialsId: '1c4653cf-fc05-47d5-aa37-4a40a772f5b6', url: 'https://github.com/evileyedlynx/Boxfuse.git'
                        withDockerContainer(args: '-d -v $WORKSPACE:/home/maven --name mav', image: 'automav:1.0') {
                            sh 'mvn package -f /home/maven'
                        }

                    
                sh 'mkdir /home/warr'
                sh 'cp $WORKSPACE/target/*.war /home/warr/'
                git credentialsId: '1c4653cf-fc05-47d5-aa37-4a40a772f5b6', url: 'https://github.com/evileyedlynx/jenk.git'
                def prodImage = docker.build("prod-image", ".")
                prodImage.push()
                    }
                }
            }

        }
    }
}