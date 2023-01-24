pipeline {
    agent any

    stages {
        stage('Deploy Production') {
            steps {
                script {
sh '''#!/bin/sh
GIT=`which git`
REPO_DIR=/var/www/html/hello-jenkins
cd ${REPO_DIR}
rm -f .git/index.lock
${GIT} config --global --add safe.directory ${REPO_DIR}
${GIT} add --all .
${GIT} commit -m "Deploy production..."
${GIT} push git push https://longnguyen97-full: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@hello-jenkins.git main'''
                }
            }
        }
    }
}
