pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
		sh 'npm install'
		echo 'Building....'
		}
	}
	stage('Test') {
		steps {
			echo 'Testing....'
			sh 'npm run test'
			
		}
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    
    post {
    	
    	success {
		   emailext attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", compressLog: true,
       			subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'wojow8@gmail.com'
		
    	}
    	
    	failure {

		   emailext attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", compressLog: true,
       			subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'wojow8@gmail.com'
    	}
    }
}
