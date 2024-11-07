all: build

build:
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	sudo chown -R $(USER):$(USER) /home/$(USER)/data/wordpress
	sudo chown -R $(USER):$(USER) /home/$(USER)/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -a

fclean: clean
	sudo rm -rf /home/$(USER)/data/wordpress
	sudo rm -rf /home/$(USER)/data/mariadb
	docker volume prune -f

re: fclean all

.PHONY: all setup build down clean re