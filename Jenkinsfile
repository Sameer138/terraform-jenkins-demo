pipleline{
  agent any
  stages{
    stage ("version"){
      steps {
        sh 'terraform --version'
      }
    }
    stage ("init"){
      steps {
        sh 'terraform init'
      }
    }
    stage ("plan"){
      steps {
        sh 'terraform plan'
      }
    }
  }
}
