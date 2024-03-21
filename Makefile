include srcs/.env

all: up
up:
	mkdir -p ${DB_VOL}
	mkdir -p ${WP_VOL}
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

fclean: down 
	@docker image rm -f $$(docker image ls -q) || echo "can't remove images"
	@docker volume rm $$(docker volume ls -q) || echo "can't remove volumes"
	@docker network rm $(docker network ls -q) 2>/dev/null || echo "can't remove networks"
	@docker system prune -a --force
	${sudo} rm -rf ${DB_VOL}
	${sudo} rm -rf ${WP_VOL}
re: fclean up

ls:
	@echo "- - - - - - - - - images - - - - - - - - - -"
	docker image ls
	@echo "- - - - - - - - - volumes - - - - - - - - - -"
	docker volume ls
	@echo "- - - - - - - - - networks - - - - - - - - - -"
	docker network ls
	@echo "- - - - - - - - - containers - - - - - - - - - -"
	docker container ls

.PHONY: all up down ps fclean re


