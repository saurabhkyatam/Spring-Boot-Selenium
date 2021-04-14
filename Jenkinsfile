pipeline {
    agent any

    stages {
        stage('Ckeckout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/saurabhkyatam/Spring-Boot-Selenium.git']]])
            }
        }
        stage('Build  ')
        {
            steps {
                bat "mvn clean"
                bat "mvn package -DdefaultValueOfSkip=true"
            }
           
        }
        stage('backup war')
        {
            steps{
               echo 'backup'
               bat 'copy /Y H:\\Tomcat\\webapps\\Spring-selenium.war  H:\\backupwar  '
              }
        }
        stage('deploy')
        {
            steps{
                echo 'deploy'
                deploy adapters: [tomcat9(credentialsId: 'Tomcat', path: '', url: 'http://localhost:8090')], contextPath: null, war: 'target/*.war'
            }
        }
    }
}
