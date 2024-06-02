pipeline {
  agent any

  environment {
    DOTNET_VERSION = '8.0.x'
    DOCKER_CREDENTIALS_ID = 'docker-hub-credentials' // Jenkins credential ID for Docker Hub login
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
    
  } 
  post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
