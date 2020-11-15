pipeline {
    environment {
    registry = "navaneethreddydevops/jenkins"
    registryCredential = 'dockerhub'
    }
    agent master
    stages {
        stage('Docker Build') {
            steps {
                script {
                    docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
            stage('Test') {
                agent {
                    ecs {
                        cloud 'jenkins-slave-ecs'
                        image 'XXXXXXXXXXXXX.dkr.ecr.us-east-1.amazonaws.com/jenkins-slave-ansible:1.0'
                        launchType 'FARGATE'
                        memory 1024
                        cpu 256
                        subnets('subnet-08086cbe2d97a1ff1')
                        securityGroups('sg-08f3f54702fb3992e')
                        taskrole 'arn:aws:iam::XXXXXXXXX:role/ecsTaskExecutionRole'
                        executionRole 'arn:aws:iam::XXXXXXXXX:role/ecsTaskExecutionRole'
                        assignPublicIp true
                        }
                    }
                    steps {
                        sh 'ansible -h'
                        }
                    }
        stage('Remove Unused docker image') {
            steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
                        }
                    }
                }
}