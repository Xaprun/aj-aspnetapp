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
      }
    }
    
    stage('Install Dependencies') {
      steps {
        echo 'Installing wget...'
        sh '''
          if ! command -v wget &> /dev/null
          then
            echo "wget could not be found, installing it..."
            sudo apt-get update && sudo apt-get install -y wget
          else
            echo "wget is already installed"
          fi
        '''
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
