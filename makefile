DOCKER_COMPOSE = docker compose

.PHONY: up-db
up-db:
	$(DOCKER_COMPOSE) up -d

shell:
	docker exec -it dev_croutons_db /bin/sh -c "mysql -uroot -pnelgento0406"

.PHONY: clean-pid
clean-pid:
	rm -f tmp/pids/server.pid

.PHONY: ps
ps:
	$(DOCKER_COMPOSE) ps --all

build:
	$(DOCKER_COMPOSE) build

up: build
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) stop

down:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) restart

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes && rm -rf mysql-data && rm -rf mysqld