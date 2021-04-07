pipeline {
    agent any

    
    environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "sau7276docker/spring_selenium"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        //registryCredential = 'fa32f95a-2d3e-4c7b-8f34-11bcc0191d70'
        dockerImage = ''
    }
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3_6_3"
    }


    stages {
        

        stage('Build & clean Stage')
        {
            steps {
                // Get some code from a GitHub repository
              //bat "mvn install -DdefaultValueOfSkip=true"
                bat "mvn clean compile"
               
            }
           
        }
        /*stage('Compile Stage')
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
           
        }*/
        stage('Build jar ')
        {
            steps {
                
                bat "mvn package -DdefaultValueOfSkip=true"
            }
           
        }
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry
                }
            }
        }
    }
    post{
        success {
                    //junit 'target/surefire-reports/TEST-me.arndc.example.testing.automation.SeleniumTest.xml'
                    archiveArtifacts 'target/Spring-selenium.jar'
                }
    }
}
