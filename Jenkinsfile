pipeline {
    agent any

    environment {
		RELEASE_VERSION = "${params.release_ver}" 
		ENVIRONMENT_NAME = "${params.env_deploy}"
	    	ARTIFACTORY_URL= "http://3.93.246.98:8081/artifactory/app-deplyment-artifacts-repo/"
    }

    stages {
		stage('Download Artifacts from Artifactory') {
            steps {
		    sh 'echo "Start Downloading artifacts from artifactory...!" '
				echo "${env.RELEASE_VERSION}"
				echo "${env.ENVIRONMENT_NAME}"
				echo "${WORKSPACE}"
				echo "${env.WORKSPACE}"
				sh	'''
					wget -r --no-parent -nH --cut-dirs=1 --reject "index.html*" ${ARTIFACTORY_URL}
					'''
				}
        }
		stage('Update aws ssm parameter') {
		    steps {
				sh 'echo " Updating aws ssm parameter...!" '
				script {
					env.ARTIFACTID_REPO="${env.RELEASE_VERSION}/binaries/${env.ENVIRONMENT_NAME}"
				}
				
				withAWS(credentials: 'aws-key-rs', region: 'us-east-1') {
				echo "${env.ARTIFACTID_REPO}"
				sh 'aws ssm put-parameter --name "hmno-nsl-scratch-artifact-id" --value ${ARTIFACTID_REPO} --type String --overwrite'
				}
				sh 'echo " aws ssm parameter updated...!" '				
			}
		}
        stage('CodeDeploy Plugin') {
            steps {
				sh 'echo "CodeDeploy Configuration post step" '
            }
            post {
                always {
                    step([
							$class: 'AWSCodeDeployPublisher', 
							applicationName: 'EC2-application-deployment', 
							credentials: 'aws-key-rs', 
							deploymentConfig: 'CodeDeployDefault.OneAtATime', 
							deploymentGroupAppspec: false, 
							deploymentGroupName: 'Charter-App-Deployment-EC2-Group', 
							excludes: '', 
							iamRoleArn: '', 
							includes: '**', 
							proxyHost: '', 
							proxyPort: 0, 
							region: 'us-east-1', 
							s3bucket: 'application-deployment-rs-2020', 
							s3prefix: 'ec2', 
							subdirectory: '', 
							versionFileName: '',
							deploymentMethod: 'deploy',
							pollingFreqSec: 15, 
							pollingTimeoutSec: 300,			
							waitForCompletion: true])
                }
            }
        }
        stage('Deployment Status') {
            steps {
                sh 'echo " Deployment is completed using CodeDeploy....!!"'
            }
        }
    }
}
