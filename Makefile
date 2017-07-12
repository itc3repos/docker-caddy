include envs
export

help: ## this info
	@# adapted from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@echo '_________________'
	@echo '| Make targets: |'
	@echo '-----------------'
	@cat Makefile | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## build gcsfuse image
	docker-compose build

up: ## bring system up, see docker-compose.yml
	@if ! docker images caddy | grep -q caddy ; \
	then \
		make build; \
	fi
	docker-compose up -d --force-recreate --remove-orphans

down: ## bring system dev-down, see docker-compose.yml
	docker-compose down --remove-orphans --volumes

restart: ## restart test system
	docker-compose restart

follow: ## docker-compose logs -f
	docker-compose logs -f

prune: ## prune local docker containers and images
	docker container prune -f
	docker image prune -f
	docker volume prune -f

sync-docker-time: ## sync docker vm time with hardware clock
	@docker run --rm --privileged alpine hwclock -s

web: ## open the site on brower
	@if curl -s -I -L http://${SITE_FQDN}:${PORT} | grep OK &> /dev/null; \
	then \
		open http://${SITE_FQDN}:${PORT}; \
	else \
		make up web;\
	fi


.PHONY: build prune push pull help up down restart follow
.PHONY: bucket destroy-bucket sync-docker-time