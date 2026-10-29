pipeline {
    agent any

    environment {
        // Carpeta absoluta para resultados y reportes
        ALLURE_RESULTS = "${env.WORKSPACE}/allure-results"
        ALLURE_REPORT  = "${env.WORKSPACE}/allure-report"
    }

    stages {
        stage('Preparar Workspace') {
            steps {
                echo "Limpiando workspace..."
                deleteDir()
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'WDIO_ALLURE_29-10-26', url: 'https://github.com/diego-heredia-dev/jenkinsQA2.git'
            }
        }

        stage('Instalar dependencias') {
            steps {
                bat 'npm install'
            }
        }

        stage('Ejecutar WDIO') {
            steps {
                echo "Ejecutando pruebas WDIO..."
                catchError(buildResult: 'UNSTABLE', stageResult: 'UNSTABLE') {
                    bat 'npx wdio run wdio.conf.js'
                }
            }
        }

        stage('Generar reporte Allure') {
            steps {
                echo "Generando reporte Allure..."
                bat """
                npx allure generate %ALLURE_RESULTS% --clean -o %ALLURE_REPORT%
                """
            }
        }

        stage('Publicar reporte Allure en Jenkins') {
            steps {
                echo "Publicando reporte Allure usando el plugin..."
                allure([
                    includeProperties: false,
                    jdk: '',
                    results: [[path: '**/allure-results/*.json']], // <-- patrón agregado
                    reportBuildPolicy: 'ALWAYS'
                ])
            }
        }
    }

    post {
        always {
            echo 'Pipeline finalizada'
        }
    }
}
