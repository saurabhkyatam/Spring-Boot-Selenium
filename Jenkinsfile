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
        stage("sonar" )
        {
            //agent { label 'Slave1' }
            
            steps{
                 withSonarQubeEnv('SonarQube') {
                    bat "mvn clean install sonar:sonar -Dsonar.java.binaries=target/classes"
                 }
               
                //bat "mvn clean install sonar:sonar -Dsonar.login=990d23d78c7a8f006fa4c5c48f3dacfcf224034f -Dsonar.java.binaries=target/classes"
            }
        }
        stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
          }
          
        stage('deploy to nexus')
        {
            environment {
                // This can be nexus3 or nexus2
                NEXUS_VERSION = "nexus3"
                // This can be http or https
                NEXUS_PROTOCOL = "http"
                // Where your Nexus is running
                NEXUS_URL = "localhost:8081"
                // Repository where we will upload the artifact
                NEXUS_REPOSITORY = "simpleapp"
                // Jenkins credential id to authenticate to Nexus OSS
                NEXUS_CREDENTIAL_ID = "nexus"
            }

            steps {
			echo 'deno'
                /*script {
                    // Read POM xml file using 'readMavenPom' step , this step 'readMavenPom' is included in: https://plugins.jenkins.io/pipeline-utility-steps
                    pom = readMavenPom file: "pom.xml";
                    // Find built artifact under target folder
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    // Print some info from the artifact found
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    // Extract the path from the File found
                    artifactPath = filesByGlob[0].path;
                    // Assign to a boolean response verifying If the artifact name exists
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                        nexusVersion: NEXUS_VERSION,
                        protocol: NEXUS_PROTOCOL,
                        nexusUrl: NEXUS_URL,
                        groupId: pom.groupId,
                        version: pom.version,
                        repository: NEXUS_REPOSITORY,
                        credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                // Artifact generated such as .jar, .ear and .war files.
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                // Lets upload the pom.xml file for additional information for Transitive dependencies
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                                ]
                        );
                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }*/
            }
        }
    }
}
