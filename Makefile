ifeq (, $(shell which docker-compose 2> /dev/null))
	DOCKER_COMPOSE="docker compose"
else
	DOCKER_COMPOSE="docker-compose"
endif

REQUIRED_VARS := TORRENTS_DIR

define CHECK_VARS
	@$(foreach var,$(REQUIRED_VARS), \
		if [ -z "$($(var))" ]; then \
			echo "Error : variable '$(var)' is mandatory."; \
			exit 1; \
		fi; )
endef

build:
	$(call CHECK_VARS)
	@echo "Building container with $(DOCKER_COMPOSE)..."
	@TORRENTS_DIR=$(TORRENTS_DIR) $(DOCKER_COMPOSE) build

install:
	$(call CHECK_VARS)
	@echo "Installing container with $(DOCKER_COMPOSE)..."
	@TORRENTS_DIR=$(TORRENTS_DIR) $(DOCKER_COMPOSE) up --no-start
