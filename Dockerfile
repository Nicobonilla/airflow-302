FROM apache/airflow:3.0.2-python3.11

# Cambiar a root para instalar dependencias
USER root

# Instalar Java (si aún lo necesitas, por ejemplo para SparkSubmitOperator)
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    openjdk-17-jdk \
    procps \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Establecer variable de entorno para Java
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Crear carpeta de datos compartidos (opcional)
RUN mkdir -p /opt/data && chown -R airflow:root /opt/data

# Cambiar a usuario airflow para instalar dependencias Python
USER airflow

# Instalar dependencias adicionales
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto de Spark UI (opcional)
EXPOSE 4040
