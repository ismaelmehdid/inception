# -d flag so containers run in background
all:
	docker-compose -f ./srcs/docker-compose.yml up -d
	@echo "\033[92mAll services are up and running.\033[0m"

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	@echo "\033[93mAll services have been shutted down.\033[0m"

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