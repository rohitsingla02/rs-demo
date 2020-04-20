pipeline {
    agent any

    environment {
        aws_access_key = "${params.aws_access_key_test}"
        aws_secret_key = "${params.aws_secret_key_test}"

    }

    stages {

        stage('CodeDeploy Plugin test') {
            steps {
                sh 'echo " CodeDeploy Plugin test started...!" '
            }
        }
        stage('CD Configuration') {
            steps {
                sh 'echo "CD Configuration post step" '
            }
            post {
                always {
                    step([
							$class: 'AWSCodeDeployPublisher', 
							applicationName: 'EC2-application-deployment', 
							awsAccessKey: '${aws_access_key}', 
							awsSecretKey: '${aws_secret_key}', 
							credentials: 'awsAccessKey', 
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
							s3prefix: '', 
							subdirectory: 'ec2', 
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
