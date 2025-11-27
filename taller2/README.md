# Taller 2: CI/CD con Jenkins y SonarQube

Este directorio contiene los recursos para el Taller 2.

## Estructura del Proyecto

*   `src/`: Código fuente de la aplicación (Backend Flask y Frontend Node.js).
*   `infra/`: Configuración de infraestructura (Docker Compose).
*   `scripts/`: Scripts de automatización para configurar SonarQube y Jenkins.

## Prerrequisitos

*   Docker
*   Docker Compose

## Instrucciones de Despliegue

1.  **Levantar Infraestructura:**
    ```bash
    docker compose -f infra/docker-compose.yml up -d
    ```

2.  **Configurar SonarQube:**
    ```bash
    ./scripts/setup_sonarqube.sh
    ```

3.  **Configurar Jenkins:**
    *   Instale plugins (Git, SonarQube Scanner, Docker).
    *   Ejecute el script `scripts/create_jenkins_jobs.groovy` en la consola de scripts de Jenkins.

## Jenkins Jobs
*   `taller2_dev` (Puerto 5000)
*   `taller2_prod` (Puerto 5001)
