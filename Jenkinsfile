pipeline {
    agent any

    environment {
		RELEASE_VERSION = 's20.05' 
		ENVIRONMENT_NAME = 'sit'
    }

    stages {
		stage('Download Artifacts test') {
            steps {
                sh 'echo " Download artifacts from artifactory test started...!" '
				echo "${env.RELEASE_VERSION}"
				echo "${env.ENVIRONMENT_NAME}"
            }
        }
		stage('Update aws ssm parameter test') {
		    steps {
				script {
					env.ARTIFACTID_REPO="${env.RELEASE_VERSION}/binaries/${env.ENVIRONMENT_NAME}"
				}
			}
		}
        stage('CodeDeploy Plugin test') {
            steps {
				withAWS(credentials: 'aws-key-rs', region: 'us-east-1') {
				echo "${env.ARTIFACTID_REPO}"
				sh 'aws ssm put-parameter --name "hmno-nsl-scratch-artifact-id" --value "s20.05/binaries/preprod" --type String --overwrite'
				}
				echo "${env.ARTIFACTID_REPO}"
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
