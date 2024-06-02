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
            echo 'Env in Win Job Worker'
            bat 'set'

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
