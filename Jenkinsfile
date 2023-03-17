#!groovy
pipeline {
   agent any
   environment {
       envTag= "${env.ENVIRONMENT}"
       testSuite= "${env.TEST_SUITE}"
   }
   stages {
    stage('Test') {
        steps {
            script {
                echo "Running on environment : ${env.ENVIRONMENT}"
                echo "Running test suite : ${env.testSuite}"
                if(isUnix()){
                    sh """mvn clean test"""
                }else{
                    bat "mvn clean test"
                }
            }
        }
    }
  }
  post {
        always {
            cucumber buildStatus: 'null',
            failedFeaturesNumber: -1,
            failedScenariosNumber: -1,
            failedStepsNumber: -1,
            fileIncludePattern: 'target/surefire-reports/*.json',
            pendingStepsNumber: -1,
            skippedStepsNumber: -1,
            sortingMethod: 'ALPHABETICAL',
            undefinedStepsNumber: -1,
            classifications: [
                ['key': 'ENVIRONMENT','value': params.ENVIRONMENT],
                ['key': 'TEST_SUITE','value': params.TEST_SUITE]
            ]
        }
    }
}