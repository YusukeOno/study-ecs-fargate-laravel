build:
	docker build -t study-ecs-fargate/nginx:latest   -f ./docker/nginx/Dockerfile .
	docker build -t study-ecs-fargate/laravel:latest -f ./docker/laravel/Dockerfile .
	
clean:
	# cf. https://docs.docker.jp/config/pruning.html#id5
	docker system prune --volumes --force

up:
	docker compose up -d

down:
	docker compose down
