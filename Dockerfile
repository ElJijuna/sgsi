FROM php:8.2-apache

# Establecer timezone y locale
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Actualizar repositorios e instalar dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  postgresql-client \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libzip-dev \
  git \
  curl \
  wget \
  vim \
  && rm -rf /var/lib/apt/lists/*

# Instalar extensiones PHP requeridas para PostgreSQL y otras funcionalidades
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) \
  pdo \
  pdo_pgsql \
  pgsql \
  gd \
  zip \
  opcache \
  && docker-php-ext-enable pdo_pgsql pgsql opcache

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Habilitar módulos Apache necesarios
RUN a2enmod rewrite headers

# Copiar archivo de configuración de Apache
RUN echo '<Directory /var/www/html>\n\
  Options Indexes FollowSymLinks\n\
  AllowOverride All\n\
  Require all granted\n\
</Directory>' > /etc/apache2/conf-available/php-app.conf && \
  a2enconf php-app

# Copiar la aplicación
COPY . /var/www/html/

# Crear directorio de logs si no existe
RUN mkdir -p /var/www/html/logs && \
  chown -R www-data:www-data /var/www/html && \
  chmod -R 755 /var/www/html && \
  chmod -R 775 /var/www/html/logs

# Copiar archivo .htaccess si existe en la raíz
RUN if [ -f /var/www/html/.htaccess ]; then \
  chown www-data:www-data /var/www/html/.htaccess; \
fi

# Configurar PHP.ini
RUN echo "upload_max_filesize = 100M\n\
post_max_size = 100M\n\
max_execution_time = 300\n\
memory_limit = 256M\n\
default_charset = UTF-8\n\
display_errors = On\n\
error_reporting = E_ALL" >> /usr/local/etc/php/php.ini

# Copiar configuración opcache
RUN echo "opcache.enable = 1\n\
opcache.memory_consumption = 128\n\
opcache.interned_strings_buffer = 16\n\
opcache.max_accelerated_files = 10000\n\
opcache.validate_timestamps = 1\n\
opcache.revalidate_freq = 2" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

# Establecer documentroot
ENV APACHE_DOCUMENT_ROOT=/var/www/html
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf

# Crear directorio de inicio para verificación
WORKDIR /var/www/html

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# Exponer puerto
EXPOSE 80

# Comando por defecto
CMD ["apache2-foreground"]
