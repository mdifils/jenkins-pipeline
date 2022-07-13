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
        // stage('test') {
        //     steps {
        //         sh './gradlew test'
        //     }
        // }
        stage('Release') {
            steps {
                echo 'Release'
            }
        }
        stage('Deploy') {
            steps {
                sh 'java -version'
                sh 'gradle -v'
                sh 'git --version'
                sh 'docker --version'
                sh 'ls -la'
            }
        }
    }
}