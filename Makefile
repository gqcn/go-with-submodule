SHELL := /bin/bash

# update submodules
.PHONY: subup
subup:
	@set -e; \
	cd examples; \
	echo "Updating submodules..."; \
	git pull origin; \
	cd ..;

# update and commit submodules
.PHONY: subsync
subsync: subup
	@set -e; \
	echo "";\
	cd examples; \
	echo "Checking for changes..."; \
	if git diff-index --quiet HEAD --; then \
		echo "No changes to commit"; \
	else \
		echo "Found changes, committing..."; \
		git add -A; \
		git commit -m "examples update"; \
		git push origin; \
	fi; \
	cd ..;
