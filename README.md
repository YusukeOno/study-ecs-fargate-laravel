# study-ecs-fargate-laravel
Studying is fun for me. ECS/Fargate, Laravel, Nginx. AWS Copilot.

## 

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
