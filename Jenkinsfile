pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3_6_3"
    }

    stages {
        

        stage('Build Stage')
        {
            steps {
                // Get some code from a GitHub repository
              bat "mvn install -DdefaultValueOfSkip=true"
               
               
            }
           
        }
        stage('Compile Stage')
        {
            steps {
              
                 bat "mvn clean compile"
            }
           
        }
        stage('Testing Stage')
        {
            steps {
                
                bat "mvn test"
            }
           
        }
        stage('Build jar ')
        {
            steps {
                
                bat "mvn package -DdefaultValueOfSkip=true"
            }
           
        }
    }
    post{
        success {
                    junit 'target/surefire-reports/TEST-me.arndc.example.testing.automation.SeleniumTest.xml'
                    archiveArtifacts 'target/selenium-thymeleaf-0.0.1-SNAPSHOT.jar'
                }
    }
}
