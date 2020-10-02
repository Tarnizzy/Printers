pipeline {
    agent any 
    stages {
        stage('build') {
            steps {
                echo 'Building ...'
                sh 'whoami'
                sh 'docker build --tag 31801943/printers:3.0 .'
                sh 'docker images'
            
            }
            
        }
        
        stage('Push') {
            steps {
                echo 'Pushing ...'
                sh 'docker login docker.io'
                sh 'docker push 31801943/printers:3.0'
            
            }
            
        }
        
        stage('deploy') {
            steps {
                echo 'Deploying  ...'
                sh 'kubectl create deployment --image=31801943/printers:3.0 letarprinters'
                sh 'kubectl expose deployment letarprinters --port=8000 --target-port=8000 --type=NodePort'
                sh 'kubectl get service'
            
            }
            
        }
    }
}
