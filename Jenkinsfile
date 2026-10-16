pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Nurassyl'
        STUDENT_SURNAME = 'Aitkul'
        STUDENT_GROUP   = 'IT2-2307'
        STUDENT_ID      = '37375'
        IMAGE_NAME      = 'aitkul-nurassyl-devops'
        CONTAINER_NAME  = 'aitkul-nurassyl-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'echo "Git commit: $(git rev-parse HEAD)"'
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                sh 'ls -la'
                sh 'python3 -m py_compile app/app.py'
                sh 'chmod +x scripts/Aitkul_Nurassyl_system.sh'
                echo 'Build stage completed: application code compiled without errors'
            }
        }

        stage('Test') {
            steps {
                sh '''
                    test -f Dockerfile
                    test -f docker-compose.yml
                    test -f app/app.py
                    grep "Student ID: 37375" Aitkul_Nurassyl_info.txt
                    bash -n scripts/Aitkul_Nurassyl_system.sh
                    echo "All tests passed"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} -t ${IMAGE_NAME}:latest .'
                sh 'docker images ${IMAGE_NAME}'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p 5000:5000 \
                      -e STUDENT_NAME=${STUDENT_NAME} \
                      -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                      -e STUDENT_GROUP=${STUDENT_GROUP} \
                      -e STUDENT_ID=${STUDENT_ID} \
                      ${IMAGE_NAME}:latest
                    sleep 3
                    docker ps --filter name=${CONTAINER_NAME}
                    docker logs ${CONTAINER_NAME}
                    curl -s http://localhost:5000
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline finished successfully for ${STUDENT_NAME} ${STUDENT_SURNAME} (${STUDENT_ID})"
        }
        failure {
            echo 'Pipeline failed. Check the stage with the error.'
        }
    }
}
