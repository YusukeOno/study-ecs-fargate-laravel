# study-ecs-fargate-laravel
Studying is fun for me. ECS/Fargate, Laravel, Nginx. AWS Copilot.

## setup AWS Copilot

```
brew install aws/tap/copilot-cli
```

```
export AWS_PROFILE="admin-role"
```

```
copilot app init dpk3-developers-laravel-webapi \
    --profile ${AWS_PROFILE} \
    --resource-tags created_date=`date '+%Y%m%d'`,created_by=${AWS_PROFILE}
```

```
copilot env init \
    --profile ${AWS_PROFILE} \
    --app dpk3-developers-laravel-webapi \
    --name laravel-webapi \
    --region ap-northeast-1
```

```
copilot svc init \
    --profile ${AWS_PROFILE} \
    --app dpk3-developers-laravel-webapi \
    --dockerfile docker/laravel/Dockerfile \
    --name laravel-webapi \
    --svc-type "Load Balanced Web Service"
```

## SSL setup for Local Environment

cf. https://blog.jxck.io/entries/2020-06-29/https-for-localhost.html  
cf. https://scrapbox.io/nwtgck/localhost

```
docker run -it -v $PWD/docker/nginx-proxy/certs:/shared ubuntu:18.04
```

```
apt update \
    && apt-get install software-properties-common \
    && add-apt-repository -y universe \
    && add-apt-repository -y ppa:certbot/certbot \
    && apt-get update \
    && apt-get install -y python-certbot-apache
```

```
certbot certonly \
-d local-api.dpk3-developers.com \
--agree-tos -m my-mail-address@example.com \
--manual --preferred-challenges dns
```

Add a TXT record to the DNS.

```
cp -a /etc/letsencrypt/live/local-api.dpk3-developers.com/fullchain.pem /shared/local-api.dpk3-developers.com.crt
cp -p /etc/letsencrypt/live/local-api.dpk3-developers.com/privkey.pem.  /shared/local-api.dpk3-developers.com.key
```
