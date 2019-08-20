node{
   
   stage("App Build started"){
      echo 'App build started..'
      git credentialsId: 'Github-ID', url: 'https://github.com/ChiragBarsaiya/python-docker-app-openshifts.git'
      }
   
   stage('Docker Build') {
     def app = docker.build "Myapp1/itrainbatman"
    }
   
   stage("Tag & Push image"){
      withDockerRegistry([credentialsId: 'dockerID',url: ""]) {
          sh 'docker tag Myapp1/itrainbatman Myapp1/itrainbatman:dev'
          sh 'docker push Myapp1/itrainbatman:dev'
          sh 'docker push Myapp1/itrainbatman:latest'
      }
    }
   
   stage("App deployment started"){
     
    }
   
    stage('App deployed to Openshift environment') {
     echo 'App deployed to Openshift environment..'
    }

   
























}
