pipeline { 
    agent any

    tools {
        maven 'Maven 3'  // The name of the Maven tool configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the GitHub repository using HTTPS with credentials
                git url: 'https://github.com/Yashaswini-31/Practicals.git', credentialsId: '316b470b-4a11-403d-83fd-117ebd46191b'
            }
        }

        stage('Build') {
            steps {
                // Build the project using Maven
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run tests (if any) using Maven
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application (this step is optional)
                echo 'Deploying the application...'
            }
        }
    }

    post {
        success {
            echo 'Build and test successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
