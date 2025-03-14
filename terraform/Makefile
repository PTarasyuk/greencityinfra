.PHONY: docs

docs:
	@echo "Generating documentation for backend..."
	cd backend && terraform-docs .
	@echo "Generating documentation for infra..."
	cd infra && terraform-docs .
