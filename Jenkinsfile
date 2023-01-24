pipeline {
    agent any

    stages {
        stage('Deploy Production') {
            steps {
                script {
			sh './deploy-production'
                }
            }
        }
    }
}
