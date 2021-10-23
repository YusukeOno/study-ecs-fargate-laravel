FROM public.ecr.aws/bitnami/php-fpm:8.0-prod

# timezone environment
ENV TZ=Asia/Tokyo

WORKDIR /app
COPY src .
COPY src/.env.example .env
RUN composer install --optimize-autoloader --no-dev
RUN php artisan key:generate

# # cf. https://aws.amazon.com/jp/premiumsupport/knowledge-center/ec2-install-extras-library-software/
# RUN amazon-linux-extras enable php7.4 && \
#     yum clean metadata && \
#     yum install -y php-cli php-pdo php-fpm php-json \
#     php-bcmath php-mbstring php-pecl-zip php-xml php-pecl-redis \
#     git tar \
#     zip \
#     unzip && \
#     # cf. https://www.kimoton.com/entry/20181123/1542961698
#     rm -rf /var/cache/yum/* && \
#     yum clean all

# WORKDIR /application
# COPY --from=BUILDER /usr/local/bin/composer /usr/local/bin/composer
# COPY src .
# COPY src/.env.example .env
# RUN composer install --optimize-autoloader --no-dev && \
#     composer require aws/aws-sdk-php-laravel && \
#     php artisan config:cache && \
#     php artisan key:generate && \
#     php artisan config:clear && \
#     php artisan cache:clear && \
#     php artisan route:clear && \
#     php artisan view:clear && \
#     php artisan config:cache && \
#     chmod -R 777 storage && \
#     composer require predis/predis

# EXPOSE 9000
# COPY docker/webapi-laravel/php/php.ini /etc/php.ini
# COPY docker/webapi-laravel/php-fpm.d/php-fpm.conf /etc/php-fpm.conf
# COPY docker/webapi-laravel/php-wfpm.d/www.conf /etc/php-fpm.d/www.conf
# ENTRYPOINT /usr/sbin/php-fpm -F
