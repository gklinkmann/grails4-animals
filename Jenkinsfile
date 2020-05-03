#!groovy

node {
	echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
	
   stage('checkout') {
      checkout scm
   }

   stage('check tools') {
      sh "pwd"
      sh "grails -version"
   }

   stage('clean') {
      sh "grails clean"
   }

   stage('test') {
   	  try {
      	sh "grails test-app"
   	  } catch (Exception e){
   	  	echo "test of ${env.BUILD_ID} failed on ${env.JENKINS_URL}"
   	  	throw e	
   	  } finally {
   	    junit 'build/test-results/**/*.xml'    
   	  }
   }

   stage('packaging') {
      sh "grailsw war"
   	  archiveArtifacts artifacts: 'build/libs/*.war', fingerprint: true
   }
}