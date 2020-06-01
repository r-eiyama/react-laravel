up:
	docker-compose up -d
	@make cache-clear
build:
	docker-compose build
install:
	cp .env.example .env
	@make up
	docker-compose exec app php artisan migrate:fresh --seed
	#docker-compose exec app php artisan migrate:fresh --seed --env=testing
reinstall:
	@make destroy
	@make install
stop:
	docker-compose stop
restart:
	docker-compose restart
down:
	docker-compose down
destroy:
	docker-compose down --rmi all --volumes
ps:
	docker-compose ps
fresh:
	docker-compose exec app php artisan migrate:fresh
migrate:
	docker-compose exec app php artisan migrate
seed:
	docker-compose exec app php artisan db:seed
tinker:
	docker-compose exec app php artisan tinker
dump:
	docker-compose exec app php artisan dump-server
test:
	docker-compose exec app php ./vendor/bin/phpunit
cache:
	docker-compose exec app composer dump-autoload -o
	docker-compose exec app php artisan optimize:clear
	docker-compose exec app php artisan optimize
cache-clear:
	docker-compose exec app php artisan optimize:clear
mysql:
	docker-compose exec db bash -c 'mysql -u$${MYSQL_USER} -p$${MYSQL_PASSWORD} $${MYSQL_DATABASE}'
ash:
	docker-compose exec app ash

