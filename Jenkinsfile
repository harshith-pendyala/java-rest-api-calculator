pipeline {
    environment{
        registry = "harshithpendyala/calculator_java"
        registryCredential='dockerhub_id'
        dockerImage= ''
    }
    agent any

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/harshith-pendyala/java-rest-api-calculator.git'
                bat './mvnw clean compile'
            }
        }
        stage('Test'){
            steps{
                bat './mvnw test'
            }
            post{
                always{
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
        }
        stage('Publish'){
            steps{
                bat './mvnw package'
            }
            post{
                success{
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage('Building Docker Image'){
            steps{
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploying Docker Image'){
                    steps{
                        script{
                            docker.withRegistry('',registryCredential){
                                dockerImage.push()
                            }
                        }
                    }
        }
        stage('cleaning up'){
                    steps{
                        script{
                            bat "docker rmi $registry:$BUILD_NUMBER"
                        }
                    }
        }
    }
}
