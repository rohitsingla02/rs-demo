pipeline {
    agent any

    environment {
		RELEASE_VERSION = "s20.05" 
		ENVIRONMENT_NAME = "sit"
    }

    stages {
		stage('Download Artifacts test') {
            steps {
                sh 'echo " Download artifacts from artifactory test started...!" '
            }
        }
		stage('Update aws ssm parameter test') {
            steps {
                sh 'echo " Download artifacts from artifactory test started...!" '
                sh'''${env.RELEASE_VERSION}'''
				env.ARTIFACTID_REPO=sh('${env.RELEASE_VERSION}/binaries/${env.ENVIRONMENT_NAME}')
				sh 'echo "${env.ARTIFACTID_REPO}"'
            }
        }
        stage('CodeDeploy Plugin test') {
            steps {
                sh 'echo " CodeDeploy Plugin test started...!" '
            }
        }

        stage('CD ended') {
            steps {
                sh 'echo " CodeDeploy script Execution Ended....!!"'
            }
        }
    }
}
