pipeline {
 agent any
 
 environment {
  registry = "obyerere1/tea-fe"
  registryCredential = 'Dockerhub'
  dockerImage = ''
 }
 
 stages {
  stage('Cloning Git') {
   steps {
    git 'https://github.com/obyerere/demoo-fe.git'
   }
  }

  stage('Building image') {
   steps{
    script {
     dockerImage = docker.build registry + ":3.3"
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
    sh "docker rmi $registry:3.3"
   }
  }
 }
}
