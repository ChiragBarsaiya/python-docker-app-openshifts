node{
   
   stage("App Build started"){
      echo 'App build started..'
      git credentialsId: 'Github-ID', url: 'https://github.com/ChiragBarsaiya/python-docker-app-openshifts.git'
      }
   
   stage('Docker Build') {
     def app = docker.build "manee2k6/itrainbatman"
    }
   
   stage("Tag & Push image"){
      withDockerRegistry([credentialsId: 'dockerID',url: ""]) {
          sh 'docker tag test1/itrainbatman test1/itrainbatman:dev'
          sh 'docker push test1/itrainbatman:dev'
          sh 'docker push test1/itrainbatman:latest'
      }
    }
    stage("App deployment started"){
     sh 'oc login --token=t01XSPheqChA1n1QxmPCSJAwm5rFNYzb7FvRP9mmg6A --server=https://api.us-east-1.online-starter.openshift.com:6443'
     sh 'oc new-app shiddu/pythonimage:dev --name python'
     sh 'oc expose svc python --name=python'
     sh 'oc status'
    }
   
    stage('App deployed to Openshift environment') {
     echo 'App deployed to Openshift environment..'
    }
