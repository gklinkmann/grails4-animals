#!groovy

node {
	echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
	
   stage('checkout') {
      checkout scm
   }

   stage('check tools') {
      sh "pwd"
      sh "gradle --version"
      sh "grails -version"
   }

   stage('clean') {
      sh "grails clean"
   }

   stage('test') {
   	  try {
      	sh "gradle test"
   	  } catch (Exception e){
   	  	echo "test of ${env.BUILD_ID} failed on ${env.JENKINS_URL}"
   	  	throw e	
   	  } finally {
   	    junit 'build/test-results/**/*.xml'    
   	  }
   }

   stage('package') {
      sh "grails war"
   	  archiveArtifacts artifacts: 'build/libs/*.war', fingerprint: true
   }

//   stage('deploy') {
//      sh "nohup java -jar -Dgrails.env=dev ./build/libs/grails4-animals-1.0.war"
//   }
}