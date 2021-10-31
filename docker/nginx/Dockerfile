FROM public.ecr.aws/nginx/nginx

WORKDIR /application/public

COPY ./src/public/healthcheck.txt /application/public/healthcheck.txt

RUN apt-get update
COPY ./docker/nginx/ecs/conf.d/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
