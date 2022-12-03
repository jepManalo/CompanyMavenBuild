pipeline {
    agent any
    
    stages {
	    stage('Build Code') {
            steps {
		            echo 'Checking out repository'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jepManalo/CompanyMavenBuild']]])
                echo 'Validating source code'
                sh 'mvn validate'
                echo 'Compiling source code'
                sh 'mvn compile'
            }
        }
		
	    stage('UI Tests') {
            steps {
		            echo 'Running UI Tests'
                script {
                    try {
                        sh 'mvn test'
                    } finally {
                        junit '**/build/test-results/test/*.xml'
                    }
                }
            }
        }
		
	    stage('Clean Build') {
            steps {
                echo 'Cleaning last build'
		            sh 'mvn clean'
            }
        }
    }
}
