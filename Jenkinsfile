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
        stage ('Checkout and build iPXE Menus') {
            steps {
                dir('build_menu') {
                    git changelog: false, branch: "master", poll: false, url: 'https://github.com/pxe2/puppet-pxe2_ipxe_menus.git'
                    sh './build.sh'
                    sh './menus.sh'
                    sh 'tree'
                }
            } 
        }
        stage ('Checkout and build iPXE Builder') {
            steps {
                dir('build_ipxe') {
                    git changelog: false, branch: "master", poll: false, url: 'https://github.com/pxe2/dockerfile-ipxe-builder.git'
                    sh 'echo "$PWD"'
                    sh './build.sh'
                    sh 'docker run -v "$PWD":/ipxe/src/bin pxe2/ipxe-builder make'
                    sh 'tree'
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
                cleanWs()
            }
    }
}