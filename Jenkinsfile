pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest'
            args '--entrypoint=""'
        }
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-creds').username
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds').password
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages {
        stage('init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
