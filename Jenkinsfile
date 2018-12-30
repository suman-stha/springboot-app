def workspace
node{
    stage('Scm checkout'){
               git credentialsId: '90d9a9a0-45ab-4204-98e6-f80e6ef02952', url: 'https://github.com/javahometech/my-app.git'


                }
    stage('Mvn package'){
            def mvnHome = tool name: 'mymaven', type: 'maven'
            def mvnCmd = "${mvnHome}/bin/mvn"
            sh "${mvnCmd} clean package"

        }
    stage('Build Docker Image'){
            sh 'docker build -t sumand123/my-app:2.0.0 .'
        }
        stage('Push Docker Image'){withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockepwd')]) {
        sh "docker login -u sumand123 -p ${dockepwd}"
    // some block
            }
            sh 'docker push  sumand123/my-app:2.0.0'
        }
        stage('deploy to tomcat server'){
     sshagent(['dev']) {
    
       sh 'ssh -o StrictHostKeyChecking=no target/*.war ec2-user@192.168.1.171'
     }
        }
        }
