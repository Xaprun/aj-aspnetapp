pipeline {
  agent any

  environment {
    DOTNET_VERSION = '8.0.x'
    DOCKER_CREDENTIALS_ID = '0b742cb6-5018-4f5d-8fa2-9fb89d492016' // Jenkins credential ID for Docker Hub login
    DOTNET_ROOT = tool name: 'dotnet'//, type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
     DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = 'true'
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
                sh '${DOTNET_ROOT}/dotnet restore'
            }
    }

    stage('Build') {
      steps {
        echo 'Building...'
         // Build the project
        sh '${DOTNET_ROOT}/dotnet build --configuration Release'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing...'
        sh '${DOTNET_ROOT}/dotnet test --no-build --configuration Release'
      }
    }

     stage('Publish') {
            steps {
                // Publish the application
                sh '${DOTNET_ROOT}/dotnet publish --configuration Release --output ./publish'
            }
        }
    
    stage('Package') {
      steps {
        echo 'Archiving...'
        // Archive the published application
        archiveArtifacts artifacts: 'publish/**/*', allowEmptyArchive: true
      }
    }

    stage('Set up Docker Buildx') {
            steps {
                sh 'docker run --privileged --rm tonistiigi/binfmt --install all'
                sh 'docker buildx create --use'
            }
        }

        stage('Log in to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
            }
        }

        stage('Build and push Docker image') {
            steps {
                sh 'docker build -t xaprun/aj-aspnetapp-alpine-k8s-jen:v0.9-test .'
                sh 'docker push xaprun/aj-aspnetapp-alpine-k8s-jen:v0.9-test'
            }
        }
    
  } 
  post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
