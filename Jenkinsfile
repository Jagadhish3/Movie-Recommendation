pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'jagadhish3-docker' // Your Docker Hub credentials ID
        IMAGE_NAME = 'jagadhish3/movie-recommender:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                echo 'Logging in and pushing image to Docker Hub...'
                script {
                    withCredentials([usernamePassword(
                        credentialsId: "${DOCKERHUB_CREDENTIALS}",
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh "docker push ${IMAGE_NAME}"
                    }
                }
            }
        }
    }
}
