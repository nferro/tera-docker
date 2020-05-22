def image
def tag

pipeline {
  environment {
    registry = "nunoferro/tera"
    registryCredential = 'dockerhub'
  }
  
  agent any
  stages {
    stage('Checkout tera-docker') {
      steps {
        checkout([$class: 'GitSCM', 
                  branches: [[name: '*/master']],
                  userRemoteConfigs: [[url: 'https://github.com/nferro/tera-docker.git']]
                ])
      }
    }
    stage('Checkout tera') {
      steps {
        checkout([$class: 'GitSCM',
                  branches: [[name: '*/master']],
                  userRemoteConfigs: [[url: 'https://gitlab.com/terafoundation/tera2.git']],
                  extensions: [
                    [$class: 'RelativeTargetDirectory', relativeTargetDir: 'tera']
                  ]
                ])
      }
    }
    stage('Get Version') {
        steps {
          script {
            commit_message = sh(returnStdout: true, script: "git log -n 1 ${checkout_result.GIT_COMMIT}")
            currentBuild.description = commit_message
            tag = sh(returnStdout: true, script: "sed -nE 's/global\\.UPDATE_CODE_VERSION_NUM\\s*=\\s*(.*);/\\1/p' tera/Source/core/constant.js").trim()
            echo "Tera version: " + tag
          }  
        }
    }
    stage('Docker build') {
      steps {
        script {
          image = docker.build(registry + ":0." + tag, ". --network=host")
        }
      }
    }
    stage('Docker push') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            image.push()
            image.push("latest")
          }
        }
      }
    }
  }
}
