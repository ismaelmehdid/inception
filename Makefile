FLAGS = -f ./srcs/docker-compose.yml
# -f -> indicating the path of the docker-compose file
# -d -> run services in background

DC_COMMAND = docker-compose

all:
	$(DC_COMMAND) $(FLAGS) up -d --build
	@echo "\033[92mAll services are up and running.\033[0m"

clean:
	$(DC_COMMAND) $(FLAGS) down
	@echo "\033[93mAll services have been shutted down.\033[0m"

fclean: clean
	docker system prune -f -a
	@echo "\033[93mAll the images have been deleted.\033[0m"

re: clean all

vclean:
	rm -rf /home/imehdid/data/db/*
	rm -rf /home/imehdid/data/wp/*

.PHONY: all clean re fclean vclean