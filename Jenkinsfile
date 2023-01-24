pipeline {
    agent any

    stages {
        stage('Deploy Production') {
            steps {
    node {
      String credentialsId="permakey"
      String gitRepo="ssh://git@github.com:longnguyen97-full/hello-jenkins.git"
      stage "Test Tag Push"
      git credentialsId: "${credentialsId}", url: "${gitRepo}"   
      tagName="MyTag"    
      sh(script: "git tag $tagName")
      sshagent([credentialsId]) {
        sh(script: 'git push --tags')
      }
    }
            }
        }
    }
}
