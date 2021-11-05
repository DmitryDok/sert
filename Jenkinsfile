pipeline {
  agent {
        dockerfile {
            args '-v /root/.ssh/:/root/.ssh/ -v /root/.aws/:/root/.aws/ -v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }
  stages {
    stage('Terraform Init&Plan') {
      steps {
        sh 'terraform init'
        sh 'terraform plan'
      }
    }
    stage('Terraform Apply') {
      steps {
        sh 'terraform apply -auto-approve'
      }
    }
    stage('Pause') {
      steps {
        sh 'sleep 30'
      }
    }
    stage('Ansible build') {
      steps {
        sh 'ssh ubuntu@${machine_ip}'
      }
    }
  }
}