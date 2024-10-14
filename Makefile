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

DANGLING_VOLUMES := $(shell docker volume ls -q --filter dangling=true)

fclean: clean
	docker system prune -f -a
	@if [ -n "$$(docker volume ls -q --filter dangling=true)" ]; then \
		docker volume rm $$(docker volume ls -q --filter dangling=true); \
	else \
		echo "No dangling volumes to remove."; \
	fi
	@echo "\033[93mAll the images have been deleted.\033[0m"


re: clean all

vclean:
	rm -rf /home/imehdid/data/db/*
	rm -rf /home/imehdid/data/wp/*

.PHONY: all clean re fclean vclean