#!groovy

node {

   stage('checkout') {
      checkout scm
   }

   stage('check tools') {
      sh "pwd"
      sh "gradle --version"
   }

   stage('clean') {
      sh "gradle clean"
   }

   stage('test') {
      sh "gradle test"
   }

   stage('packaging') {
      sh "gradle war"
   }
   stage('deploying') {
      sh "gradle deployTest"
   }
}