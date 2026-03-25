<?php
    // Configuración de Base de Datos
    // Lee variables de entorno si están disponibles (Docker), sino usa valores por defecto (desarrollo local)
    
    define("DATABASE_DRIVER", getenv("DB_DRIVER") ?: "pgsql");
    define("DATABASE_HOST", getenv("DB_HOST") ?: "localhost");
    define("DATABASE_PORT", getenv("DB_PORT") ?: "5432");
    define("DATABASE_NAME", getenv("DB_NAME") ?: "sgsi_db");
    define("DATABASE_USER", getenv("DB_USER") ?: "postgres");
    define("DATABASE_PASSWORD", getenv("DB_PASSWORD") ?: "pilmee");