def SUFFIX = ''

pipeline {
    agent {
        dockerfile {
            args '-v /vagrant:/vagrant'
        }
    }
    parameters {
        string (name: 'VERSION_PREFIX', defaultValue: '0.0.0', description: 'pxe.to version')
    }
    environment {
        BUILD_TAG = "${env.BUILD_TAG}".replaceAll('%2F','_')
        BRANCH = "${env.BRANCH_NAME}".replaceAll('/','_')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '30'))
    }
    stages {
        stage ('Checkout iPXE Menus') {
            steps {
                dir('build'){
                    git changelog: false, branch: "master", poll: false, url: 'https://github.com/pxe2/puppet-pxe2_ipxe_menus.git'
                    sh './build.sh'
                }
            } 
        }
        stage ('Checkout dockerfile iPXE Builder') {
            steps {
                dir('build'){
                    git changelog: false, branch: "master", poll: false, url: 'https://github.com/pxe2/dockerfile-ipxe-builder.git'
                    sh './build.sh'
                }
            } 
        }
    }
}