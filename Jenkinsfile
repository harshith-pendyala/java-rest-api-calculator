pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/harshith-pendyala/java-rest-api-calculator.git'
                bat './mvnw clean compile'
            }
        }
    }
}
