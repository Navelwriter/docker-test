pipeline {
    // Define the agent for the entire pipeline.
    // Using a Docker image with necessary build tools (like gcc and make).
    agent {
        docker {
            image 'gcc:latest' // Use a standard GCC image for building
            args '-u root'     // Optional: Run as root inside container if permissions are an issue
        }
    }

    // Define parameters for the pipeline.
    parameters {
        booleanParam(name: 'RELEASE', defaultValue: false, description: 'Set to true for a release build')
    }

    // Define the stages of the pipeline.
    stages {
        stage('Build') {
            steps {
                echo "Starting build..."
                // Clean the project before building
                sh 'make clean'
                // Build the project, passing the RELEASE parameter as an environment variable to the Makefile
                sh "RELEASE=${params.RELEASE} make all"
                echo "Build complete."
            }
        }
    }

    // Post-build actions (optional but good practice)
    post {
        success {
            echo 'Pipeline succeeded.'
            // Archive the built executable as an artifact
            archiveArtifacts artifacts: 'my_app', fingerPrint: true
        }
        failure {
            echo 'Pipeline failed.'
        }
        always {
            echo 'Pipeline finished.'
        }
    }
}