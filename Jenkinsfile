pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = "${params.aws_access_key_test}"
        AWS_SECRET_KEY_ID = "${params.aws_secret_key_test}"

    }

    stages {

        stage('CodeDeploy Plugin test') {
            steps {
                sh 'echo " CodeDeploy Plugin test started...!" '
            }
        }
        stage('CD Configuration') {
            steps {
                sh 'echo "${AWS_ACCESS_KEY_ID}" '
		echo "${AWS_ACCESS_KEY_ID}"
		sh 'echo "CD Configuration post step" '
            }
            post {
                always {
			sh 'echo "${AWS_ACCESS_KEY_ID}" '
			echo "${AWS_ACCESS_KEY_ID}"
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
        stage('CD ended') {
            steps {
                sh 'echo " CodeDeploy script Execution Ended....!!"'
            }
        }

        
    }
}
