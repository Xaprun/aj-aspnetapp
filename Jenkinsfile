pipeline {
  agent any

  environment {
        DOTNET_VERSION = '8.0.x'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials' // Jenkins credential ID for Docker Hub login
  }

  stages {
    stage('Prep') {
          steps {
            echo 'Preparing...'
            sh '''
              pwd
              ls
              '''
            sh 'printenv'
            script {
            sh 'end'
            sh 'end'
          }
        }
    }
    
    stage('Setup .NET SDK') {
            steps {
                sh 'wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh'
                sh 'chmod +x dotnet-install.sh'
                sh './dotnet-install.sh -c $DOTNET_VERSION'
                sh 'export PATH="$PATH:$HOME/.dotnet"'
            }
    }

    stage('Build') {
          steps {
            echo 'Building...'
          }
    }

    stage('Test') {
          steps {
            echo 'Testing...'
          }
    }
    
    stage('Package') {
          steps {
            echo 'Archiving...'
          }
    }
    
    stage('Publish') {
          steps {
            echo 'Publishing...'
          }
    }
  }
}
