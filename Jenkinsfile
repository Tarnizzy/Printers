pipeline {
    agent any 
    stages {
        stage('build') {
            steps {
                echo 'Building ...'
                sh 'rm -rf printers'
                sh 'cp -r /home/tarnizzy/Django_Projects/printers/ /home/tarnizzy/.jenkins/workspace/pipeline_new'
                sh 'echo \"from shell v=printers:${cat /proc/sys/kernel/random/uuid}\"'
                echo 'v'
                sh 'docker build --tag 31801943/printers:$v ./printers/'
                sh 'docker images'
            
            }
            
        }
        
        stage('Push') {
            steps {
                echo 'Pushing ...'
                sh 'docker login docker.io'
                sh 'docker push 31801943/printers:$v'
            
            }
            
        }
        
        stage('deploy') {
            steps {
                echo 'Deploying  ...'
                sh 'kubectl create deployment --image=31801943/printers:$v letarprinters'
                sh 'kubectl expose deployment letarprinters --port=8000 --target-port=8000 --type=NodePort'
                sh 'kubectl get service'
            
            }
            
        }
    }
}
