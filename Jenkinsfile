pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials-id'  // Use the ID of your Docker Hub credentials
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Pull code from GitHub or your version control system
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t jagadhish3/movie-recommender .'
                }
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker push jagadhish3/movie-recommender:latest'
                    }
                }
            }
        }
    }
}
