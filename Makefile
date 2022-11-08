NAME=Inception
DB_PATH=/home/junylee/data

all : $(NAME)

$(NAME) :
	sudo mkdir -p $(DB_PATH)
	sudo mkdir -p $(DB_PATH)/mariadb
	sudo mkdir -p $(DB_PATH)/wordpress
	make up

init : 
	sudo echo "127.0.0.1	junylee.42.fr" >> /etc/hosts

up :
	docker-compose -f ./srcs/docker-comse.yml up --build

down :
	docker-compose -f ./srcs/docker-comse.yml down

clean : down
	sudo rm -rf $(DB_PATH)

fclean : clean
	sudo bash remove.sh

re : fclean all

.PHONY : init all clean fclean re down