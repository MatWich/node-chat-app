pipeline {
	agent {
		dockerfile {
			filename "Dockerfile.build"
		}
	}
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
			docker 'node:latest'
		}
            steps {
                echo 'Deploying....'
		unstash 'ARTEFACT'
		unstash 'ARTEFACTT'
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
