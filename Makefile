.PHONY: help build install

help:
	@echo "Available targets:"
	@awk '/^[a-zA-Z_-]+:.*?###/ { printf "  %-15s : ", $$1; $$1=""; sub(/^ *### */, "", $$0); print $$0 }' $(MAKEFILE_LIST)

play: ### run playbook roles/fedora/tasks/main.yml
	@cd ansible && \
	ansible-playbook roles/fedora/tasks/main.yml

ping: ### ping all hosts defined in inventory
	@cd ansible && \
	ansible all -m ping
