node {
    stage('clone git project') {
        git 'https://github.com/irfanahmed786/hello-world-master.git'
    }
    stage('build maven project'){
        def mvnHOME = tool name: 'Maven', type: 'maven'
        def mvnCMD = "$mvnHOME/bin/mvn"
        sh "$mvnCMD clean install"
    }
    stage('copy artifacts'){
        sshagent(['dockeradmin']) {
            sh "scp -p /var/lib/jenkins/workspace/hello-world-project_dev/webapp/target/webapp.war dockeradmin@192.168.56.125:/opt/docker_project/docker-images/hello-world/prod/"
        }
    }
    stage('deploy hello world through ansible'){
        sshagent(['ansiadmin']) {
            def runHelloWorld = 'ansible-playbook /opt/ansiadm/projects/k8s/hello-world.yml'
            sh "ssh -o StrictHostKeyChecking=no -l ansiadmin 192.168.56.125 ${runHelloWorld}"
        }
    }
}
