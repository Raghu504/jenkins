pipeline {
  agent any

  environment {
    IMAGE_NAME     = "my-react-app"
    CONTAINER_NAME = "react-container"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build & Push Docker Image') {
      steps {
        script {
          def img = docker.build(IMAGE_NAME)
        }
      }
    }

    stage('Deploy (Run Container)') {
      steps {
        script {
          sh "docker rm -f ${CONTAINER_NAME} || true"
          sh "docker run -d --name ${CONTAINER_NAME} -p 3000:80 ${IMAGE_NAME}"
        }
      }
    }
  }

  post {
    always {
      sh 'docker image prune -f'
    }
  }
}
