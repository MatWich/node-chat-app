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
		when {
			expression {
				params.executeTests
				}				
			}
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
    		mailext attachlog: true,
    		body: "${currentBuild.currentResult}": Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
    		receipentProviders: [developers(), requestor()],
    		to: "wojow8@gmail.com"
    		subject: "Success tests in pipeline: ${currnetBuild.fullDisplayName}"
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
