pipeline {
    agent any
    
    triggers {
        cron('H * * * *')
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hoodini2117/devops-project'
            }
        }
        
        
        stage('Check Disk Usage') {
            steps {
                script {
                    sh '''
                        chmod +x example-script-pipeline/examples/disk_check.sh
                        ./example-script-pipeline/examples/disk_check.sh
                    '''
                }
            }
        }
        
        stage('Process Management') {
            steps {
                script {
                    sh '''
                        chmod +x example-script-pipeline/examples/process_monitor.sh
                        ./example-script-pipeline/examples/process_monitor.sh
                    '''
                }
            }
        }
    }
    
    post {
        failure {
            emailext (
                subject: "CRITICAL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """
                    FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':
                    Check console output at '${env.BUILD_URL}'
                    """,
                to: 'sahilnihalani0@gmail.com',
                from: 'jenkins@syndrizzle.me'
            )
        }
    }
}
