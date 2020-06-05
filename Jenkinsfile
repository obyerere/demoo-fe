pipeline {
    
 environment {
  registry = "obyerere1/tea-fe"
  registryCredential = 'Dockerhub'
  dockerImage = ''
 }
 
 agent any
 tools {nodejs "node"}
 stages {
  stage('Git Checkout') {
   steps {
    git 'https://github.com/obyerere/demoo-fe.git'
   }
  }

stage('Restore & Build') {
   steps{
        sh 'npm install'
        sh 'ng build'
   }
  }

  stage('Building image') {
   steps{
    script {
     dockerImage = docker.build registry + ":3.4"
    }
   }
  }
  stage('Deploy Image') {
   steps{
    script {
     docker.withRegistry( '', registryCredential ) {
      dockerImage.push()
     }
    }
   }
  }
  stage('Remove Unused docker image') {
   steps{
    sh "docker rmi $registry:3.4"
   }
  }
 }
}
