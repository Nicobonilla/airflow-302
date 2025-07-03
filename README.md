# airflow

Apache Airflow 3.0.2 deployed on Docker Compose
Apache Spark 3.5.0 apache/spark:3.5.0 
Work


touch .env
# Clave Fernet para cifrar contraseñas en la DB de Airflow
echo "AIRFLOW__CORE__FERNET_KEY=$(openssl rand -base64 32)" > .env

# Clave secreta del servidor web (puede ser otra aleatoria)
echo "AIRFLOW__WEBSERVER__SECRET_KEY=$(openssl rand -hex 16)" >> .env

# UID de usuario 
echo "AIRFLOW_UID=$(id -u)" >> .env

  
# Usuario y contraseña del panel de Airflow
_AIRFLOW_WWW_USER_USERNAME=admin
_AIRFLOW_WWW_USER_PASSWORD=admin

docker compose build --no-cache
docker compose up airflow-init (solo una vez)

docker compose up -d
docker compose down
docker compose start
