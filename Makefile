.PHONY: dev-setup
dev-setup:
	@sh ./scripts/dev-setup.sh

.PHONY: dev-teardown
dev-teardown:
	@docker-compose down
