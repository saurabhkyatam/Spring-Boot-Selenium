pipeline {
    agent any

    stages {
        
        stage('Build Package ')
        {
            steps {
                bat 'mvn clean'
                bat 'mvn package -DdefaultValueOfSkip=true'
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
                nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'selenium-thymeleaf', 
                        classifier: '', 
                        file: 'target/*.war',
                        type: 'war']
                     ], 
                    credentialsId: 'nexus', 
                    groupId: 'me.arndc.example.testing',
                    nexusUrl: 'localhost:8081',
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'simpleapp',
                    version: '0.0.1'
                //deploy adapters: [tomcat9(credentialsId: 'Tomcat', path: '', url: 'http://localhost:8090')], contextPath: null, war: 'target/*.war'
            }
        }
    }
}
