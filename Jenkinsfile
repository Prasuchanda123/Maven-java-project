pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
        jdk 'JAVA_HOME'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Prasunachanda123/Maven-java-project.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Archive WAR') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                    curl -u tomcat:tomcat \
                    --upload-file target/java-docker-app.war \
                    "http://20.220.32.127:8080/manager/text/deploy?path=/javaapp&update=true"
                '''
            }
        }
    }
}

