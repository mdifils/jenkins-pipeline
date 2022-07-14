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
                sh 'java -jar build/libs/caesar-cipher.jar'
            }
        }
        stage('Release') {
            steps {
                sh 'tag=$(git describe --tags)'
                sh "git for-each-ref refs/tags/$tag --format=\'%(contents)\'"
            }
        }
        // stage('Build docker image') {
        //     steps {
        //         sh 'docker  build -t mdifils/caesar-cipher:$BUILD_ID .'
        //     }
        // }
        // stage('Publish docker image') {
        //     steps {
        //         withDockerRegistry([credentialsId: 'dockerhub', url: ""]){
        //             sh 'docker  push mdifils/caesar-cipher:$BUILD_ID'
        //         }
        //     }
        // }
        stage('Deploy') {
            steps {
                sh 'ls -la'
                sh 'java -version'
                sh 'gradle -v || true'
                sh 'git version || true'
                sh 'docker version || true'
                sh 'printenv || true'
            }
        }
    }
}