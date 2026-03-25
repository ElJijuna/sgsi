#!/bin/bash

# Script para restaurar backup de PostgreSQL en Docker

set -e

echo "=== Iniciando restauración de backup de PostgreSQL ==="

# Variables de entorno
DB_USER="${POSTGRES_USER:-sgsi_user}"
DB_NAME="${POSTGRES_DB:-sgsi_db}"
DB_HOST="${DB_HOST:-localhost}"
BACKUP_FILE="/docker-entrypoint-initdb.d/sgsi.backup"

# Esperar a que PostgreSQL esté listo
echo "Esperando a que PostgreSQL esté disponible..."
until pg_isready -h localhost -U "$DB_USER"; do
  sleep 1
done

echo "PostgreSQL está disponible"

# Verificar si el archivo de backup existe
if [ -f "$BACKUP_FILE" ]; then
  echo "Backup encontrado: $BACKUP_FILE"
  
  # Restaurar el backup
  echo "Restaurando backup..."
  psql -U "$DB_USER" -d "$DB_NAME" -f "$BACKUP_FILE" 2>&1 || {
    echo "Error durante la restauración, intentando con pg_restore..."
    pg_restore -U "$DB_USER" -d "$DB_NAME" -v "$BACKUP_FILE" 2>&1 || {
      echo "No se pudo restaurar con pg_restore, el archivo podría ser un dump SQL"
      psql -U "$DB_USER" -d "$DB_NAME" < "$BACKUP_FILE"
    }
  }
  
  echo "✓ Backup restaurado exitosamente"
else
  echo "Archivo de backup no encontrado en: $BACKUP_FILE"
  echo "Se creará una base de datos vacía"
fi

echo "=== Proceso de restauración completado ==="
