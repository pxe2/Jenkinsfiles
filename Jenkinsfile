def SUFFIX = ''

pipeline {
    agent any

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
        stage ('Checkout and build iPXE Builder') {
            steps {
                dir('build_ipxe') {
                    sh 'mkdir -p build'
                    sh 'docker run -v "$PWD/build":/ipxe/src/bin pxe2/ipxe-builder make'
                }
            } 
        }
        stage ('Checkout and build iPXE Menus') {
            steps {
                dir('build_menu') {
                    git changelog: false, branch: "master", poll: false, url: 'https://github.com/pxe2/puppet-pxe2_ipxe_menus.git'
                    sh 'rm -rf build && ./build.sh && ./menus.sh'
                }
            } 
        }
        
        stage ('Organize files') {
            steps {
                sh ''
            }
        }
        stage ('Code signing') {
            steps {
                sh ''
            }
        }
        stage ('Upload to GitHub') {
            steps {
                sh ''
            }
        }

    } 
    post {
            always {
               //cleanWs()
            }
    }
}