pipeline {
    agent any

    stages {
        stage('Example') {
            environment { 
                ARTIFACTORY_CREDENTIALS = credentials('permakey') 
            }
            steps {
                echo "user: $ARTIFACTORY_CREDENTIALS_USR password: $ARTIFACTORY_CREDENTIALS_PSW"
            }
        }
        stage('Deploy Production') {
            steps {
withCredentials([sshUserPrivateKey(credentialsId: 'permakey', keyFileVariable: 'GITHUB_KEY')]) {
    sh 'echo ssh -i $GITHUB_KEY -l git -o StrictHostKeyChecking=no \\"\\$@\\" > run_ssh.sh'
    sh 'chmod +x run_ssh.sh'
    withEnv(['GIT_SSH=run_ssh.sh']) {
        sh '''#!/bin/sh
        GIT=`which git`
        REPO_DIR=/var/www/html/hello-jenkins
        cd ${REPO_DIR}
        ${GIT} add --all .
        ${GIT} commit -m "Deploy production..."
        ${GIT} push https://longnguyen97-full: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@hello-jenkins.git --all main'''
    }
}
            }
        }
    }
}
