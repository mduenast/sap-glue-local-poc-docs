.PHONY: setup doctor build serve clean

PYTHON ?= python3.12
VENV := .venv
PIP := $(VENV)/bin/pip
MKDOCS := $(VENV)/bin/mkdocs

setup:
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

doctor:
	@command -v python3 >/dev/null 2>&1 || { echo "ERROR: python3 was not found. Install Python 3, then run make setup."; exit 1; }
	@echo "OK: python3 is available."
	@test -f requirements.txt || { echo "ERROR: requirements.txt is missing."; exit 1; }
	@echo "OK: requirements.txt exists."
	@test -f mkdocs.yml || { echo "ERROR: mkdocs.yml is missing."; exit 1; }
	@echo "OK: mkdocs.yml exists."
	@test -x $(MKDOCS) || { echo "ERROR: $(MKDOCS) was not found. Run make setup."; exit 1; }
	@echo "OK: $(MKDOCS) exists."

build:
	$(MKDOCS) build --strict

serve:
	$(MKDOCS) serve

clean:
	rm -rf site .cache
