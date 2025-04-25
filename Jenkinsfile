pipeline{
    agent any

    parameters{
         booleanParam(name: 'RELEASE', defaultValue: false, description: 'Set to true for a release build')
    }

    stages{
        stage('Build'){
            agent{
                // Use a Docker image with a GCC compiler for Linux
                docker {
                    image 'gcc:latest' // Using the official GCC image
                    args '-u root' // Run as root inside container if needed for permissions
                }
            }
            steps{
                echo 'Building...'
                sh 'make clean'
                sh "RELEASE=${params.RELEASE} make all"
                echo "Linux Native build complete."
            }
        }
        stage('Test'){
            agent any
            steps{
                echo 'Testing...'
                sh './app test test test waaaaaaa'
            }
        }
        stage('Deploy'){
            steps{
                echo 'Deploying...'
            }
        }
    }
}