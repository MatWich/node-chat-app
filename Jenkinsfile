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
       			subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", from: 'shadowmurloc63@gmail.com', to: 'wojow8@gmail.com'
		
    	}
    	
    	failure {

		   mail bcc: '', attachLog: true, body: 'Przeszlo przez pipelina', cc: '', from: '', replyTo: '', subject: 'sending mail', to: 'wojow8@gmail.com'
    	}
    }
}
