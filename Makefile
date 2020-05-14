install:
	sh bin/install.sh

ps:
	docker-compose ps

up:
	docker-compose up -d

stop:
	docker-compose stop

deploy:
	sh bin/deploy.sh

restart: stop up

bash_app:
	docker-compose exec apache bash

cache_clean:
	docker-compose exec -T apache drush cr

clean:
	rm -rf data vendor
	docker-compose rm --stop --force
	docker volume prune -f || true
	docker network prune -f || true
	rm -r data/*