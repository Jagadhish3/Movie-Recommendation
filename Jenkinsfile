pipeline {
    agent any

    environment {
        // Define any environment variables here
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Jagadhish3/Movie-Recommendation.git'
            }
        }

        stage('Set Up Python Environment') {
            steps {
                sh '''
                    python -m venv venv
                    source venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Application') {
            steps {
                sh '''
                    source venv/bin/activate
                    python app.py
                '''
            }
        }

        stage('Docker Build and Push') {
            steps {
                sh '''
                    docker build -t jagadhish3/movie-recommendation:latest .
                    docker push jagadhish3/movie-recommendation:latest
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
