// Jenkinsfile for My CI Project

pipeline {
    agent any // We'll define agents per stage using Docker

    parameters {
        booleanParam(name: 'RELEASE', defaultValue: false, description: 'Set to true for a release build')
    }

    stages {
        stage('Checkout') {
            steps {
                // This step is implicitly handled by the Pipeline script from SCM configuration
                // but you could add explicit checkout steps if needed for complex scenarios
                echo 'Checking out code...'
            }
        }

        stage('Build Linux Native') {
            agent {
                // Use a Docker image with a GCC compiler for Linux
                docker {
                    image 'gcc:latest' // Using the official GCC image
                    args '-u root' // Run as root inside container if needed for permissions
                }
            }
            steps {
                echo "Building for Linux Native..."
                // Pass the RELEASE parameter as an environment variable to the Makefile
                sh 'make clean'
                sh "RELEASE=${params.RELEASE} make all"
                echo "Linux Native build complete."
            }
        }

        stage('Build PowerPC') {
            agent {
                // *** Placeholder for PowerPC build environment ***
                // This would be a Docker image containing a PowerPC cross-compilation toolchain
                // or a PowerPC emulator (like QEMU) with a Linux environment.
                // Creating this image is complex and depends on your specific PowerPC target.
                // Example (this image likely doesn't exist or work out-of-the-box for your target):
                // docker {
                //     image 'my-powerpc-cross-compile-image:latest'
                //     args '-u root'
                // }
                 // For demonstration, we'll just print a message
                docker {
                     image 'alpine' // Use a minimal image just to run a shell command
                     args '-u root'
                }
            }
            steps {
                echo "Attempting to build for PowerPC..."
                // In a real scenario, you would run your cross-compilation command here
                // Example: sh 'powerpc-linux-gnu-gcc main.c -o my_app_powerpc'
                // Or run your Makefile with the appropriate cross-compiler flags
                // sh "CC=powerpc-linux-gnu-gcc RELEASE=${params.RELEASE} make all"
                echo "PowerPC build step placeholder executed."
                echo "NOTE: A real PowerPC build requires a specific cross-compilation environment."
            }
        }

        stage('Test') {
            agent any // Can run tests on any available agent
            steps {
                echo "Running tests (placeholder)..."
                // Add your test commands here
                // sh './my_app' // Example: run the native build
            }
        }

        stage('Archive Artifacts') {
             agent any
             steps {
                 echo "Archiving build artifacts..."
                 // Archive the built executable(s)
                 archiveArtifacts artifacts: 'my_app', fingerPrint: true
                 // You would archive the PowerPC executable here too if the build was successful
                 // archiveArtifacts artifacts: 'my_app_powerpc', fingerPrint: true
             }
         }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}