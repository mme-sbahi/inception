all: up
up:
	mkdir -p /home/mmesbahi/Desktop/data/mdata
	mkdir -p /home/mmesbahi/Desktop/data/wdata
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

fclean: down
	docker rm $$(docker ps -qa)
	docker image rm -f $$(docker images ls -q)
	docker volume rm $$(docker volume ls -q)
	docker system prune -a --force
	sudo rm -rf /home/mmesbahi/Desktop/data

re: fclean up

.PHONY: all up down ps fclean re


