properties([ parameters([
  string( name: 'AWS_ACCESS_KEY_ID', defaultValue: 'AKIAVAUKT66Q2FAQYQZ3'),
  string( name: 'AWS_SECRET_ACCESS_KEY', defaultValue: '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'),
  string( name: 'AWS_REGION', defaultValue: 'ap-south-1'),
]), pipelineTriggers([]) ])

// Environment Variables.
env.access_key = AWS_ACCESS_KEY_ID
env.secret_key = AWS_SECRET_ACCESS_KEY
env.aws_region = AWS_REGION


pipeline {
    agent any
    stages {
         stage ('Terraform Init'){
            steps {
            sh "export TF_VAR_aws_region='${env.aws_region}' && terraform init"
          }
       }
         stage ('Terraform Plan'){
            steps {
            sh "export TF_VAR_aws_region='${env.aws_region}' && terraform plan" 
         }
      }
         stage ('Terraform Apply & Deploy Docker Image on Webserver'){
            steps {
            sh "export TF_VAR_aws_region='${env.aws_region}' && terraform apply -auto-approve"
        }
      }
    }
  }
