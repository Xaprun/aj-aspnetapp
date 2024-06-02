pipeline {
  agent any

  environment {
    DOTNET_VERSION = '8.0.x'
    DOCKER_CREDENTIALS_ID = 'docker-hub-credentials' // Jenkins credential ID for Docker Hub login
    DOTNET_ROOT = tool name: 'dotnet'//, type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
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
    
    stage('Restore') {
            steps {
                // Restore dependencies
                sh 'dotnet restore'
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
