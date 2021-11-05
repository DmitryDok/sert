pipeline {
  agent {
        dockerfile {
            args '-v /root/.ssh/:/root/.ssh/ -v /root/.aws/:/root/.aws/ -v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }
  stages {
    stage('TF Init&Plan') {
      steps {
        sh 'terraform init'
        sh 'terraform plan'
      }
    }
    stage('TF Apply') {
      steps {
        sh 'terraform apply -input=false'
      }
    }
  }
}