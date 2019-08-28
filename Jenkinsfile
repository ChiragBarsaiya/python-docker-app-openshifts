node{
   
   stage("App Build started"){
      echo 'App build started..'
      git credentialsId: 'git', url: 'https://github.com/ChiragBarsaiya/python-docker-app-openshifts.git'
      }
   
   stage('Docker Build') {
     def app = docker.build "chiragbarsaiya/itrainbatman"
    }
   
   stage("Tag & Push image"){
      withDockerRegistry([credentialsId: 'docker',url: ""]) {
          sh 'docker tag chiragbarsaiya/itrainbatman chiragbarsaiya/itrainbatman:dev'
          sh 'docker push chiragbarsaiya/itrainbatman:dev'
       
      }
    }
    stage("App deployment started"){
     sh 'oc login https://api.pro-us-east-1.openshift.com --token=sarMrT0n13hfgP8J92EfFTXlDzpy09Ad4Nw8BCuiH7A'
     sh 'oc new-app chiragbarsaiya/itrainbatman:dev --name python'
     sh 'oc expose svc python --name=python'
     sh 'oc status'
    }
   
    stage('App deployed to Openshift environment') {
     echo 'App deployed to Openshift environment..'
    }
}
