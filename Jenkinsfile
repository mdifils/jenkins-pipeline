pipeline {
    agent any

    // environment {
    //     REPO = "mdifils/jenkins-pipeline"
    // }

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
                withCredentials([string(credentialsId: 'github-token', variable: 'TOKEN')]){
                    sh 'TAG=$(git describe --tags)'
                    sh 'TAG_MSG="$(git tag -l $TAG --format=\'%(contents)\')"'
                    sh '''#!/bin/bash
                          DATA='{
                            "tag_name": "'$TAG'",
                            "target_commitish": "main",
                            "name": "'$TAG'",
                            "body": "'$TAG_MSG'",
                            "draft": false,
                            "prerelease": false
                          }'
                       '''
                    sh '''#!/bin/bash
                          release=$(curl -X POST
                          -d $DATA
                          -H "Authorization: token $TOKEN"
                          https://api.github.com/repos/mdifils/jenkins-pipeline/releases)
                       '''
                    echo $release
                }
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
                sh '''#!/bin/bash
                    ls -la
                    java -version
                    git version
                    docker version
                    printenv
                   '''
            }
        }
    }
}