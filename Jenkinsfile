pipeline {
    agent any

    stages {
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
