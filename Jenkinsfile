node{
   
   stage("App Build started"){
      echo 'App build started..'
      git credentialsId: 'git', url: 'https://github.com/ChiragBarsaiya/python-docker-app-openshifts.git'
      }
   
   stage('Docker Build') {
     def app = docker.build "test1/itrainbatman"
    }
   
   stage("Tag & Push image"){
      withDockerRegistry(credentialsId: 'DockerHub', url: 'https://hub.docker.com/') {
          sh 'docker tag test1/itrainbatman test1/itrainbatman:dev'
          sh 'docker push test1/itrainbatman:dev'
       
      }
    }
    stage("App deployment started"){
     sh 'oc login https://api.pro-us-east-1.openshift.com --token=sarMrT0n13hfgP8J92EfFTXlDzpy09Ad4Nw8BCuiH7A --server=https://api.us-east-1.online-starter.openshift.com:6443'
     sh 'oc new-app dctest12/test1/itrainbatman:dev --name python'
     sh 'oc expose svc python --name=python'
     sh 'oc status'
    }
   
    stage('App deployed to Openshift environment') {
     echo 'App deployed to Openshift environment..'
    }
}
