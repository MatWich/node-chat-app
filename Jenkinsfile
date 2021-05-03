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
    		echo 'All test passed'
    		emailext attachLog: true,
		    subject: "Job '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
		    body: """<p>SUCCESS: Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a></p>""",
		    recipientProviders: [developers(), requestor()],
		    to: "wojow8@gmail.com",
		    from: "shadowmurloc63@gmail.com"
		
    	}
    	
    	failure {
    		mail bcc: '', body: 'Przeszlo przez pipelina', cc: '', attachLog: true, from: '', replyTo: '', subject: 'sending mail', to: 'wojow8@gmail.com'
    	}
    }
}
