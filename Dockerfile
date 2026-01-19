FROM php:8.2-apache

# Enable Apache rewrite (optional but good)
RUN a2enmod rewrite

# Copy your project into Apache web root
COPY . /var/www/html/

# Render uses $PORT, Apache must listen on it
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf \
 && sed -i 's/:80/:${PORT}/g' /etc/apache2/sites-available/000-default.conf
