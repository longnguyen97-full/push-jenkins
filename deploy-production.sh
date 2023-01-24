#!/bin/sh
GIT=`which git`
REPO_DIR=/var/www/html/push-jenkins
cd ${REPO_DIR}
${GIT} add --all .
${GIT} commit -m "Deploy production..."
${GIT} push git@github.com:longnguyen97-full/hello-jenkins.git main
