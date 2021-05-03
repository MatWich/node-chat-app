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
			sh 'npm run test > testRes.log'
			
		}
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    
    post {
    	always {
    		echo "THis will always show up"
    	}
    	
    	success {
    		echo 'All test passed'
    		emailext (
		    subject: "Job '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
		    body: """<p>Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a></p>""",
		    to: "wojow8@gmail.com",
		)
    	}
    	
    	failure {
    		emailext (
		    subject: "Job '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
		    body: """<p>Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a></p>""",
		    to: "wojow8@gmail.com",
		)
    	}
    }
}
