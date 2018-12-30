def workspace
node{
    stage('Scm checkout'){
               git 'https://github.com/suman-stha/springboot-app.git'



                }
    stage('Mvn package'){
            def mvnHome = tool name: 'mymaven', type: 'maven'
            def mvnCmd = "${mvnHome}/bin/mvn"
            sh "${mvnCmd} clean package"

        }
    stage('Build Docker Image'){
            sh 'docker build -t sumand123/myspring:2.0.0 .'
        }
        stage('Push Docker Image'){withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u sumand123 -p ${dockerHubPwd}"
    // some block
            }
            sh 'docker push  sumand123/myspring:2.0.0'
        }
        stage('deploy to tomcat server'){
     sshagent(['pem-tomcatser']) {
    
       sh 'ssh -o StrictHostKeyChecking=no target/*.war ec2-user@52.15.194.138:/opt/tomcat9/webapps/'
     }
        }
        }
