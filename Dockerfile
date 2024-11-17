# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

################################################################################

# The example below uses the PHP Apache image as the foundation for running the app.
# By specifying the "8.2.12-apache" tag, it will also use whatever happens to be the
# most recent version of that tag when you build your Dockerfile.
# If reproducability is important, consider using a specific digest SHA, like
# php@sha256:99cede493dfd88720b610eb8077c8688d3cca50003d76d1d539b0efc8cca72b4.
# FROM php:8.2.12-apache

# Copy app files from the app directory.
#mm COPY . /var/www/html

# Your PHP application may require additional PHP extensions to be installed
# manually. For detailed instructions for installing extensions can be found, see
# https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions
# The following code blocks provide examples that you can edit and use.
#
# Add core PHP extensions, see
# https://github.com/docker-library/docs/tree/master/php#php-core-extensions
# This example adds the apt packages for the 'gd' extension's dependencies and then
# installs the 'gd' extension. For additional tips on running apt-get:
# https://docs.docker.com/go/dockerfile-aptget-best-practices/
# RUN apt-get update && apt-get install -y \
#     libfreetype-dev \
#     libjpeg62-turbo-dev \
#     libpng-dev \
# && rm -rf /var/lib/apt/lists/* \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install -j$(nproc) gd
#
# Add PECL extensions, see
# https://github.com/docker-library/docs/tree/master/php#pecl-extensions
# This example adds the 'redis' and 'xdebug' extensions.
# RUN pecl install redis-5.3.7 \
#    && pecl install xdebug-3.2.1 \
#    && docker-php-ext-enable redis xdebug

# Use the default production configuration for PHP runtime arguments, see
# https://github.com/docker-library/docs/tree/master/php#configuration
#mm RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Switch to a non-privileged user (defined in the base image) that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
#mm USER www-data


# Utilizar una imagen base de Windows con Apache y PHP
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar las dependencias necesarias para Apache y PHP
RUN powershell -Command \
    Install-WindowsFeature -Name Web-Server -IncludeManagementTools; \
    Install-WindowsFeature -Name Web-Asp-Net45; \
    Install-WindowsFeature -Name Web-WebSockets; \
    Install-WindowsFeature -Name Web-ISAPI-Ext; \
    Install-WindowsFeature -Name Web-ISAPI-Filter

# Descargar e instalar PHP
RUN powershell -Command \
    Invoke-WebRequest -Uri https://windows.php.net/downloads/releases/php-8.0.10-Win32-vs16-x64.zip -OutFile php.zip; \
    Expand-Archive php.zip -DestinationPath C:\php; \
    Remove-Item -Force php.zip; \
    Set-ItemProperty -Path 'HKCU:\Environment' -Name Path -Value "$env:Path;C:\php"

# Configurar PHP en Apache
RUN powershell -Command \
    echo 'LoadModule php_module "C:/php/php7apache2_4.dll"' >> C:\inetpub\wwwroot\conf\httpd.conf; \
    echo 'PHPIniDir "C:/php"' >> C:\inetpub\wwwroot\conf\httpd.conf; \
    echo 'AddHandler application/x-httpd-php .php' >> C:\inetpub\wwwroot\conf\httpd.conf

# Instalar MySQL (utilizando una imagen oficial de MySQL para la base de datos)
FROM mysql:8.0 as mysql

# Crear una base de datos en MySQL
ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=sistema_telefonico
ENV MYSQL_USER=mmera
ENV MYSQL_PASSWORD=1234

# Exponer los puertos necesarios
EXPOSE 80 443 3306

# Definir el comando para ejecutar Apache en primer plano
CMD ["httpd", "-D", "FOREGROUND"]
