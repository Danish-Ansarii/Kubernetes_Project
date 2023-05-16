// node {
//    stage('get git code'){
//       git branch:'main',url:'https://github.com/Danish-Ansarii/Kubernetes_Project.git'
//    }
//    stage('send docker file to ansible'){
//       sshagent(['dani']) {
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203'
//       sh 'scp /var/lib/jenkins/workspace/pipeline/* ubuntu@18.176.57.203:/home/ubuntu'

//       }  
//    }
//    stage('Build Docker file'){
//       sshagent(['dani']) {
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 cd /home/ubuntu'
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 docker image build -t $JOB_NAME:v1.$BUILD_ID .'
//       }  
//    }
//    stage('tag docker file'){
//       sshagent(['dani']) {
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 cd /home/ubuntu'
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 docker image tag $JOB_NAME:v1.$BUILD_ID danish84464/$JOB_NAME:v1.$BUILD_ID'
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 docker image tag $JOB_NAME:v1.$BUILD_ID danish84464/latest'
//       }
//    }
//    stage('push Docker image to Docker hub'){
//       sshagent(['dani']) {
//       withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 docker login -u danish84464 -p ${docker_pass}'
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 docker image push danish84464/$JOB_NAME:v1.$BUILD_ID'
//       sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.176.57.203 docker image push danish84464/latest'

//       }
//    }
// }
// }
