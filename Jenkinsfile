pipeline {
    agent any

    environment {
		RELEASE_VERSION = "${params.release_ver}" 
		ENVIRONMENT_NAME = "${params.env_deploy}"
	    	ARTIFACTORY_URL= "http://3.93.246.98:8081/artifactory/app-deplyment-artifacts-repo/"
    }

    stages {
		stage('Download Artifacts test') {
            steps {
		    sh 'echo " Download artifacts from artifactory test started...!" '
				echo "${env.RELEASE_VERSION}"
				echo "${env.ENVIRONMENT_NAME}"
				echo "${WORKSPACE}"
				echo "${env.WORKSPACE}"
				sh'''
		                wget -r --no-parent -nH --cut-dirs=1 --reject "index.html*" ${ARTIFACTORY_URL}
                		'''
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
				sh 'aws ssm put-parameter --name "hmno-nsl-scratch-artifact-id" --value ${ARTIFACTID_REPO} --type String --overwrite'
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
