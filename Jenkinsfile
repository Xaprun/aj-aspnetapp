pipeline {
    agent {
        label 'ubuntu-latest'
    }

    environment {
        DOTNET_VERSION = '8.0.x'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials' // Jenkins credential ID for Docker Hub login
    }

    stages {
        stage('Test') {
            steps {
                echo "Start from Dockerfile"
            }
        }
    }
    tages {
        stage('Checkout code') {
            steps {
                echo "Start from Dockerfile"
            }
        }
    }
}