pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-web-app-image'  // Name of the Docker image
        DOCKER_CONTAINER = 'my-web-app-container' // Name of the container
        MAVEN_HOME = '/usr/share/maven' // Maven installation in the Docker container
        PATH = "${MAVEN_HOME}/bin:${env.PATH}" // Maven path
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from the GitHub repository
                git 'https://github.com/Yashaswini-31/My-Web-App.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with the Java application and Maven
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Build and Test with Maven') {
            steps {
                script {
                    // Run Maven build and test commands inside the Docker container
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'mvn clean install'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container with the built Java web application
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'java -jar target/my-web-app.jar'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline successfully completed!'
        }
        failure {
            echo 'There was a failure in the pipeline.'
        }
    }
}
