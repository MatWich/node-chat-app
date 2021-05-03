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
    		echo 'Some tests failed...'
    		mailext attachlog: true,
    		body: "${currentBuild.currentResult}": Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
    		receipentProviders: [developers(), requestor()],
    		to: "wojow8@gmail.com"
    		subject: "Failed tests in pipeline: ${currnetBuild.fullDisplayName}"
    	}
    }
}
