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
            echo 'Env variables check'
            echo $DOTNET_VERSION
            echo $DOCKER_CREDENTIALS_ID
            echo 'checkout scm'
            checkout scm
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
