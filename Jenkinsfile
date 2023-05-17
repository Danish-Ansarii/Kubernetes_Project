node {
   stage('get git code'){
      git branch:'main',url:'https://github.com/Danish-Ansarii/Kubernetes_Project.git'
   }
   stage('send docker file to ansible'){
      sshagent(['dani']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21'
      sh 'scp /var/lib/jenkins/workspace/pipeline/* ubuntu@35.77.220.21:/home/ubuntu'

      }  
   }
   stage('Build Docker file'){
      sshagent(['dani']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 cd /home/ubuntu'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 docker image build -t $JOB_NAME:v1.$BUILD_ID .'
      }  
   }
   stage('tag docker file'){
      sshagent(['dani']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 cd /home/ubuntu'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 docker image tag $JOB_NAME:v1.$BUILD_ID danish84464/$JOB_NAME:v1.$BUILD_ID'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 docker image tag $JOB_NAME:v1.$BUILD_ID danish84464/latest'
      }
   }
   stage('push Docker image to Docker hub'){
      sshagent(['dani']) {
      withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 docker login -u danish84464 -p ${docker_pass}'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 docker image push danish84464/$JOB_NAME:v1.$BUILD_ID'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.77.220.21 docker image push danish84464/latest'

      }
   }
}
   stage('Senf Docker file to k8s Cluster'){
      sshagent(['k8s']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.14.246'
      sh 'scp /var/lib/jenkins/workspace/pipeline/* ubuntu@172.31.14.246:/home/ubuntu'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.14.246 whoami'

      }  
   }
    stage('Run playbook in ansible'){
      sshagent(['k8s']) {
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.12.106'
      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.12.106 ansible-playbook /home/ubuntu/ansible.yml'
      

      }  
   }



}
