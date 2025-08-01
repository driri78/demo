pipeline {
    agent any

    environment {
		APP_NAME = 'demo-app'
	}
	
	stages {
		stage('Clone'){
			steps{
				git branch: 'main', url: 'https://github.com/driri78/demo.git'
			}
		}
		
		stage('Build'){
			steps{
				sh './gradlew build'
			}
		}
		
		stage('Docker Build'){
			steps{
				sh "docker build -t ${APP_NAME}:latest ."
			}
		}
		
		stage('Run Container'){
			steps{
				sh "docker rm -f ${APP_NAME} || true"
				sh "docker run -d --name ${APP_NAME} -p 8080:8080 ${APP_NAME}latest"
			}
		}
	}
	
	post{
		success{
			echo '배포 성공!'
		}
		failure{
			echo '빌드 실패'
		}
	}
	
}