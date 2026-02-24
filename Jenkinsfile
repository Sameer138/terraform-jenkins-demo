pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        SECRET_NAME = 'terraform/jenkins/aws-credentials'
    }
    tools {
  git 'Default'
}


    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Fetch AWS Credentials from Secrets Manager') {
            steps {
                script {
                    def secret = sh(
                        script: "aws secretsmanager get-secret-value --secret-id ${SECRET_NAME} --query SecretString --output text",
                        returnStdout: true
                    ).trim()

                    def secretJson = readJSON text: secret

                    env.AWS_ACCESS_KEY_ID = secretJson.AWS_ACCESS_KEY_ID
                    env.AWS_SECRET_ACCESS_KEY = secretJson.AWS_SECRET_ACCESS_KEY
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var="bucket_name=sameer-jenkins-terraform-bucket"'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var="bucket_name=sameer-jenkins-terraform-bucket"'
            }
        }
    }
}
