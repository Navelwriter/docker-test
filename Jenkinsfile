pipeline{
    agent {
        docker {
            image 'gcc:latest' // Use a standard GCC image for building
            args '-u root'     // Optional: Run as root inside container if permissions are an issue
        }
    }

    parameters{
         booleanParam(name: 'RELEASE', defaultValue: false, description: 'Set to true for a release build')
    }

    stages{
        stage('Build'){
            steps{
                echo 'Building...'
                sh 'make clean'
                sh "RELEASE=${params.RELEASE} make all"
                echo "Linux Native build complete."
            }
        }
        stage('Test'){
            steps{
                echo 'Testing...'
                sh './app test test test waaaaaaa'
            }
        }
    }
    post{
        success{
            echo 'Post-build actions...'
            archiveArtifacts artifacts: 'my_app', fingerprint: true
        }
        failure {
            echo 'Pipeline failed.'
        }
        always {
            echo 'Pipeline finished.'
        }
    }
}