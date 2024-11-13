# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataouaf <ataouaf@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/08 13:04:06 by ataouaf           #+#    #+#              #
#    Updated: 2024/11/13 11:43:25 by ataouaf          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

up:
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build -d

build:
	docker compose -f srcs/docker-compose.yml build

start:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -a --volumes -f

fclean: clean
	sudo rm -rf /home/$(USER)/data

re: fclean all

.PHONY: all build down clean re