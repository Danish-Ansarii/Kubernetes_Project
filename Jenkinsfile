node{
    stage('getting file from git '){
        git branch: 'main',url: 'https://github.com/Danish-Ansarii/Kubernetes_Project.git'
    }
    stage('adding dockerfile to jenkins node'){
        sshagent(['ansible_demo']) {
         sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16'
         sh 'scp /var/lib/jenkins/workspace/pipeline/* ubuntu@18.183.51.16:/home/ubuntu'
        }
    }
    
    
    stage('Build a docker file and tag'){
        sshagent(['ansible_demo']) {
         sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 cd /home/ubuntu'
         sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image build -t $JOB_NAME:V1.$BUILD_ID .'
         sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image tag $JOB_NAME:V1.$BUILD_ID danish84464/$JOB_NAME:V1.$BUILD_ID'
         sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image tag $JOB_NAME:V1.$BUILD_ID daish84464/latest'
         
        }
    }
    stage('Push Docker image to Docker Hub'){
    sshagent(['ansible_demo']) {
        sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 cd /home/ubuntu'   
        sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker login -u danish84464 -p Danish@61110'
        sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image push danish84464/$JOB_NAME:V1.$BUILD_ID'
        sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.183.51.16 docker image push danish84464/latest'
        }
   }
    
    
 
    
    
    
}