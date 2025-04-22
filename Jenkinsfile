/*Jenkinsfile for automatically building the Dockerized version of the app
node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("zrxmoto/geometrywebdocker:latest")
    }

    stage('Test') {
        /* Some Unit Tests */

        app.inside {
            sh 'echo "Running Tests"'
            sh 'cd /app'
            sh 'python3 -m unittest GeometryTest.py'
            sh 'python3 -m unittest cylinderTest.py'
        }
    }

    stage('Push') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            //app.push("${env.BUILD_NUMBER}")
            //app.push("latest")
            app.push() }
        
    }
}
