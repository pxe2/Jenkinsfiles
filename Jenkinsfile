def SUFFIX = ''

pipeline {
    agent {
        dockerfile {
            args '-v /vagrant:/vagrant'
        }
    }
    parameters {
        string (name: 'VERSION_PREFIX', defaultValue: '0.0.0', description: 'pxe.to version')
        string (name: "MENU_BUILDER_VERSION", defaultValue: '0.0.0', description 'ipxe menu builder version')
        string (name: "IPXE_BUILDER_VERSION", defaultValue: '0.0.4', description 'ipxe builder version')

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
                dir('build_menu'){
                    git changelog: false, branch: "master", poll: false, url: 'https://github.com/pxe2/puppet-pxe2_ipxe_menus.git'
                    sh './build.sh'
                    sh 'tree'
                }
            } 
        }
        stage ('Checkout and build iPXE Builder') {
            steps {
                dir('build_ipxe'){
                    git changelog: false, branch: "master", poll: false, url: 'https://github.com/pxe2/dockerfile-ipxe-builder.git'
                    sh './build.sh'
                    sh 'tree'
                }
            } 
        }
    }
}