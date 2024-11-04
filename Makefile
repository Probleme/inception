NAME = inception
DC = docker-compose -f srcs/docker-compose.yml
DATA_PATH = /home/$(USER)/data

all: permissions $(NAME)

permissions:
	@echo "Creating necessary directories..."
	@sudo mkdir -p $(DATA_PATH)/wordpress
	@sudo mkdir -p $(DATA_PATH)/mariadb
	@sudo chown -R $(USER):$(USER) $(DATA_PATH)

$(NAME):
	$(DC) up --build -d

clean:
	$(DC) down

fclean: clean
	docker system prune -af
	sudo rm -rf $(DATA_PATH)

re: fclean all

.PHONY: all clean fclean re permissions $(NAME)

