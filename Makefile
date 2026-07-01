.PHONY: setup build serve clean

PYTHON ?= python3.12
VENV := .venv
PIP := $(VENV)/bin/pip
MKDOCS := $(VENV)/bin/mkdocs

setup:
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

build:
	$(MKDOCS) build --strict

serve:
	$(MKDOCS) serve

clean:
	rm -rf site .cache
