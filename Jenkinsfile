pipeline {
  agent {
    docker {
      image 'node:20.17.0'  // Updated to match your application's Node version
    }
  }

  environment {
    IMAGE_NAME = "my-react-app"
    CONTAINER_NAME = "react-container"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Run Docker Container') {
      steps {
        sh '''
          docker rm -f $CONTAINER_NAME || true
          docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE_NAME
        '''
      }
    }
  }
}
