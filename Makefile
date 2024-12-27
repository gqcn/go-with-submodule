SHELL := /bin/bash


.PHONY: subsup
subup: 
	@set -e; \
	cd examples; \
	echo "Updating submodules..."; \
	git pull origin; \

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
