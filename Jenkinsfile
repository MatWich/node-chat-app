pipeline {
	agent none
    tools {
	    nodejs "node"
    }
	
	parameters {
	string (
            defaultValue: 'Dockerfile.build',
            description: 'variable for build dockercontainer',
            name : 'BUILD')
	}
	
    stages {
        stage('Build') {
		agent any
            steps {
		sh 'npm install'
		echo 'Building....'
		    /*script {
		    	currentBuild.result = 'UNSTABLE'
		    }*/
		 stash includes: 'node_modules/*', name: 'ARTEFACT'
		 stash includes: 'package-lock.json', name: 'ARTEFACTT'
		}
	}
	stage('Test') {
		agent any
		steps {
			script {
				if (currentBuild.result == 'UNSTABLE')
					error('Stopping early due to build stage fail.')
			}
			echo 'Testing....'
			sh 'npm run test'
			
		}
        }
        stage('Deploy') {
		agent {
			label 'slave'
		}
            steps {
                echo 'Deploying....'
		unstash 'ARTEFACT'
		unstash 'ARTEFACTT'
		sh 'ls'
            }
        }
    }
    
    post {
    	success {
	 emailext attachLog: true, 
		 body: "${currentBuild.result}: ${BUILD_URL}", 
		 compressLog: true, 
		 subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", 
		 to: 'shadowmurloc63@gmail.com'
		
    	}
    	failure {
		emailext attachLog: true,
			body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}", 
			subject: ' Jenkins notification', 
			to: 'shadowmurloc63@gmail.com'
    	}
    }
}
