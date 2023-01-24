pipeline {
    agent any

    stages {
        stage('Deploy Production') {
            steps {
                script {
sh '''#!/bin/sh
GIT=`which git`
REPO_DIR=/var/www/html/hello-jenkins
sudo cd ${REPO_DIR}
sudo rm -f .git/index.lock
sudo ${GIT} config --global --add safe.directory ${REPO_DIR}
sudo ${GIT} add --all .
sudo ${GIT} commit -m "Deploy production..."
sudo ${GIT} push git push origin main'''
                }
            }
        }
    }
}
