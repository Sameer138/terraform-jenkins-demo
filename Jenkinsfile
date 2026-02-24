pipeline {
    agent any

    environment {
        SECRET_NAME = "jenkins/terraform/aws-creds"
        AWS_REGION  = "ap-south-1"
    }

    stages {

        stage('Fetch Secrets from AWS') {
            steps {
                script {
                    def secret = sh(
                        script: """
                        aws secretsmanager get-secret-value \
                        --secret-id $SECRET_NAME \
                        --region $AWS_REGION \
                        --query SecretString \
                        --output text
                        """,
                        returnStdout: true
                    ).trim()

                    def json = readJSON text: secret

                    env.AWS_ACCESS_KEY_ID = json.AWS_ACCESS_KEY_ID
                    env.AWS_SECRET_ACCESS_KEY = json.AWS_SECRET_ACCESS_KEY
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
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
