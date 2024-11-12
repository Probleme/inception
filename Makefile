# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ataouaf <ataouaf@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/08 13:04:06 by ataouaf           #+#    #+#              #
#    Updated: 2024/11/08 13:04:18 by ataouaf          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build

build:
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -a

fclean: clean
	sudo rm -rf /home/$(USER)/data
	docker volume prune -f

re: fclean all

.PHONY: all build down clean re