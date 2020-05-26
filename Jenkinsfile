pipeline {
  agent { node { label 'dockeragent' } }
  stages {
    stage('Build Stage') {
      steps {
        script {
          echo 'Running Build Stage .............................................>>>>>>>>'
          ./mvnw spring-boot:run
        }
      }
    }
  }
}
