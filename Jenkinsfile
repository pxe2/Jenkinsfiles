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
                    sh 'docker run -v  `pwd`/build:/ipxe/src/bin pxe2/ipxe-builder make'
                }
            } 
        }
        stage ('Checkout and build iPXE Menus') {
            steps {
                dir('build_menu') {

                    sh 'mkdir -p build'
                    sh 'docker run -v `pwd`/build:/pxe2 pxe2/ipxe-menu-builder'
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
}