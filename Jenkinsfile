pipeline {
	agent any
    tools {
	    nodejs "node"
	    org.jenkinsci.plugins.docker.commons.tools.DockerTool "docker"
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
            steps {
                echo 'Deploying....'
		unstash 'ARTEFACT'
		unstash 'ARTEFACTT'
		    script {
		    def image = docker.image("ubuntu")
		    image.inside {
		    	sh 'apt-get -y update'
			sh 'apt-get -y install git '
			sh 'apt-get install npm -y'
		    	sh 'git clone https://github.com/binhxn/node-chat-app.git'
			sh 'cd node-chat-app'
		    }
		    }

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
