pipeline {
    agent any

    environment {
        REPO = "mdifils/jenkins-pipeline"
    }

    stages {
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
        // stage('Release') {
        //     steps {
        //         withCredentials([string(credentialsId: 'github-token', variable: 'TOKEN')]){
        //             sh '''#!/bin/bash
        //                 TAG=$(git describe --tags | cut -d "-" -f 1)
        //                 TAG_MSG=$(git tag -l $TAG --format='%(contents)')
        //                 DATA='{
        //                     "tag_name": "'$TAG'",
        //                     "target_commitish": "main",
        //                     "name": "'$TAG'",
        //                     "body": "'$TAG_MSG'",
        //                     "draft": false,
        //                     "prerelease": false
        //                 }'
        //                 curl -o release.json -X POST -d "$DATA" \
        //                     -H "Authorization:token $TOKEN" \
        //                     -H "Accept: application/vnd.github+json" \
        //                     "https://api.github.com/repos/$REPO/releases"
        //                '''
        //             sh '''#!/bin/bash
        //                 zip artifacts.zip build/libs/caesar-cipher.jar
        //                 # ID=$(grep id release.json  | head -n 1 | cut -d : -f2 | cut -d , -f1 | cut -d ' ' -f2)
        //                 ID=$(jq '.id' release.json)
        //                 curl -X POST \
        //                     --data-binary @artifacts.zip \
        //                     -H "Authorization:token $TOKEN" \
        //                     -H "Content-Type: application/json" \
        //                     -H "Accept: application/vnd.github+json" \
        //                     "https://api.github.com/repos/$REPO/releases/$ID/assets?name=artifacts.zip"
        //                '''
        //         }
        //     }
        // }
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
        // stage('Upload') {
        //     steps {
        //         sh 'pwd'
        //         sh 'zip artifacts.zip build/libs/caesar-cipher.jar'
        //         sh 'ls -la'
        //     }
        // }
    }
    post { // always, failure, changed
        always {
            // archiveArtifacts artifacts: '*.json', onlyIfSuccessful: true

            emailtext to: 'michel.difils@gmail.com',
            subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!',
            body: 'Report about: $JOB_NAME\nMore Info can be found here: $BUILD_URL',
            attachLog: true
            // attachmentsPattern: '*.json'
        }
    }
}