pipeline 
{
    agent any
    stages {
        stage ("Clean") {
            steps {
                cleanWs()
            }
        }
        stage('code') {
            steps {
                git credentialsId: 'github-credentials', url: 'https://github.com/goli-veena/my-docker-repo.git'
                sh "chmod 777 build.sh"
                sh "chmod 777 deploy.sh"
                sh "chmod +x build.sh"
                sh "chmod +x deploy.sh"
            }
        }
        stage('Build-dev-prod-repo') {
            steps {
                script {
                  sh "./build.sh" 
                }
            }
        }
        stage('pushing docker images to hub with every branch') {
            steps {
                script {
					withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
						sh "docker login -u goliveena79@gmail.com -p ${dockerHubPwd}"
                    }
						if (env.BRANCH_NAME == 'master') {
							sh "docker push 7674043534/prodrepo:latest"
						} else if (env.BRANCH_NAME == 'dev') {
							sh "docker push 7674043534/devrepo:latest"
						} else {
							echo "We didn't find branches"
						}
                }
            }
        }   
	}
}
