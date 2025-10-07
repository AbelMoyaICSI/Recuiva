FROM python:3.10-slim

# Metadatos
LABEL maintainer="Abel Moya <amoya2@upao.edu.pe>"
LABEL description="Recuiva Backend - Active Recall con Embeddings"

# Establecer directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements
COPY backend/requirements.txt .

# Instalar dependencias Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código del backend
COPY backend/ .

# Crear directorio de output
RUN mkdir -p /app/output

# Exponer puerto
EXPOSE 8000

# Variables de entorno
ENV PYTHONUNBUFFERED=1
ENV TRANSFORMERS_CACHE=/app/.cache

# Comando por defecto
CMD ["python", "launcher.py"]
