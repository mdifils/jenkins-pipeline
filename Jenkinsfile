pipeline {
    agent any

    stages {
        stage('Preparing gradlew') {
            steps {
                sh 'chmod +x gradlew'
            }
        }
        stage('build') {
            steps {
                sh './gradlew build'
            }
        }
        stage('test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Release') {
            steps {
                echo 'Release'
            }
        }
        stage('Deploy') {
            steps {
                sh 'ls -la'
                sh 'java -version'
                sh 'gradle -v || true'
                sh 'git --version || true'
                sh 'docker --version || true'
            }
        }
    }
}