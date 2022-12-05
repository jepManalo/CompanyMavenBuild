pipeline {
	agent any

	stages {
		stage('Build Code') {
			steps {
				echo 'Checking out repository...'
				checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jepManalo/CompanyMavenBuild']]])
				echo 'Validating source code...'
				bat 'mvn validate'
				echo 'Compiling source code...'
				bat 'mvn compile'
			}
		}

		stage('UI Tests') {
			steps {
				echo 'Running UI Tests...'
				script {
					try {
						bat 'mvn test'
					} finally {
						echo 'Posting Results...'
						junit '**/target/surefire-reports/TEST-*.xml'
					}
				}
			}
		}

		stage('Clean Build') {
			steps {
				echo 'Cleaning last build...'
				bat 'mvn clean'
			}
		}
	}
}
