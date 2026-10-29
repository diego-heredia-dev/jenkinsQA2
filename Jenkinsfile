pipeline {
    agent any

    stages {

        stage('Preparar Workspace') {
            steps {
                echo 'Preparando workspace...'
                deleteDir()
            }
        }

        stage('Checkout') {
            steps {
                echo 'Descargando proyecto desde GitHub...'
                checkout scm
            }
        }

        stage('Instalar dependencias') {
            steps {
                echo 'Instalando dependencias de Node.js...'
                bat 'npm install'
            }
        }

        stage('Ejecutar pruebas WDIO en BrowserStack') {
            steps {
                echo 'Ejecutando pruebas con WebdriverIO, Appium y BrowserStack...'

                withCredentials([
                    string(
                        credentialsId: 'browserstack-user',
                        variable: 'BROWSERSTACK_USER'
                    ),
                    string(
                        credentialsId: 'browserstack-key',
                        variable: 'BROWSERSTACK_KEY'
                    )
                ]) {
                    catchError(
                        buildResult: 'UNSTABLE',
                        stageResult: 'UNSTABLE'
                    ) {
                        bat 'npx wdio run ./wdio.conf.js'
                    }
                }
            }
        }

        stage('Generar reporte Allure') {
            steps {
                echo 'Generando reporte HTML de Allure...'

                bat 'npx allure generate allure-results --clean -o allure-report'
            }
        }

        stage('Publicar reporte Allure') {
            steps {
                echo 'Publicando resultados de Allure en Jenkins...'

                allure([
                    includeProperties: false,
                    jdk: '',
                    results: [[path: 'allure-results']],
                    reportBuildPolicy: 'ALWAYS'
                ])
            }
        }
    }

    post {
        always {
            echo 'Pipeline finalizada.'
        }
    }
}