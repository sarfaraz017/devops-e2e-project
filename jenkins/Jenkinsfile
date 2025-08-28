
pipeline {
  agent any
  environment {
    IMAGE = "${env.DOCKER_REGISTRY}/${env.REPO_NAME}:${env.BUILD_NUMBER}"
  }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Unit tests') {
      steps {
        sh 'python3 -m venv venv || true'
        sh '. venv/bin/activate && pip install -r app/requirements.txt && pytest -q app/tests'
      }
    }
    stage('Build Docker image') {
      steps {
        sh 'docker build -t $IMAGE -f docker/Dockerfile .'
      }
    }
    stage('Push image') {
      steps {
        withCredentials([
          usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS'),
          [$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']
        ]) {
          sh '''
            if [ -n "$DOCKER_REGISTRY" ] && echo $DOCKER_REGISTRY | grep -qE "amazonaws"; then
              aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $DOCKER_REGISTRY
            else
              echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin $DOCKER_REGISTRY
            fi
            docker push $IMAGE
          '''
        }
      }
    }
    stage('Deploy to Kubernetes') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'kubeconfig', usernameVariable: 'KUSER', passwordVariable: 'KPASS')]) {
          sh '''
            helm upgrade --install myapp helm/myapp --set image.repository=${env.DOCKER_REGISTRY}/${env.REPO_NAME} --set image.tag=${env.BUILD_NUMBER}
          '''
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
