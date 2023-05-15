node {
    stage("git checkout") {
        git branch: 'main', url: 'https://github.com/Danish-Ansarii/Kubernetes_Project.git'
    }
    
    stage("copy Dockerfile to ansible server") {
        sshagent(['ansible_demo']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16'
            sh 'scp  /var/lib/jenkins/workspace/pipeline/* ubuntu@18.183.51.16:/home/ubuntu'
        }
    }
    stage('Build docker images using Dockerfile'){
            sshagent(['ansible_demo']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 cd /home/ubuntu'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image build -t $JOB_NAME:v1.$BUILD_ID .'
            }
    }


    stage('Tag Docker image'){
            sshagent(['ansible_demo']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 cd /home/ubuntu'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image tag $JOB_NAME:v1.$BUILD_ID danish84464/$JOB_NAME:v1.$BUILD_ID'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image tag $JOB_NAME:v1.$BUILD_ID danish84464/latest'
            
            }
    }
}
