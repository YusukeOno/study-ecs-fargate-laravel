FROM public.ecr.aws/bitnami/php-fpm:8.0-prod

# timezone environment
ENV TZ=Asia/Tokyo

WORKDIR /app
COPY src .
COPY src/.env.example .env
RUN apt-get update \
    && apt-get install -y git zip unzip \
    && composer install --optimize-autoloader --no-dev \
    && php artisan key:generate \
    && php artisan config:clear \
    && php artisan route:clear \
    && php artisan view:clear \
    && chmod -R 777 storage

EXPOSE 9000
# COPY docker/webapi-laravel/php/php.ini /etc/php.ini
# COPY docker/webapi-laravel/php-fpm.d/php-fpm.conf /etc/php-fpm.conf
# COPY docker/webapi-laravel/php-wfpm.d/www.conf /etc/php-fpm.d/www.conf
# ENTRYPOINT /usr/sbin/php-fpm -F
