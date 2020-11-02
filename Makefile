MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
ROOTDIR := $(shell dirname $(MKFILE_PATH))


## help: show this help
help: $(PHONY) Makefile
	@echo ""
	@sed -n 's/^##//p' $^ | column -t -s ':' |  sed -e 's/^/ /';
	@echo ""


# If the first argument is "up"...
# taken from: https://stackoverflow.com/questions/2214575/passing-arguments-to-make-run
ifeq (up,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "up"
  UP_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(UP_ARGS):;@:)
endif

## up: run the app stack in containers
up: $(PHONY) down
	docker-compose up --build --renew-anon-volumes -d $(UP_ARGS)
	@if [ -n "$(VERBOSE)" ]; then docker-compose logs --follow; fi


# If the first argument is "down"...
# taken from: https://stackoverflow.com/questions/2214575/passing-arguments-to-make-run
ifeq (down,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "up"
  DOWN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(DOWN_ARGS):;@:)
endif


## down: tear down the app stack
down: $(PHONY)
	docker-compose down -v --remove-orphans $(DOWN_ARGS)
