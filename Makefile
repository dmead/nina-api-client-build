PYTHON := python3
VENV := nina-api


$(VENV)/bin/activate:
	$(PYTHON) -m venv $(VENV)
	@echo "Virtual environment created at $(VENV)"

install: $(VENV)/bin/activate requirements.txt
	. $(VENV)/bin/activate && pip install -r requirements.txt
	@echo "dependencies installed"

# Run a Python script using venv
run: $(VENV)/bin/activate
	. $(VENV)/bin/activate && python client.py

# Remove venv
clean:
	rm -rf $(VENV)
	@echo "Virtual environment removed"

download-spec:
	curl https://bump.sh/christian-photo/doc/advanced-api.json > nina-spec.json

build:
	. $(VENV)/bin/activate && openapi-python-client generate --path=./spec-formatted.json --overwrite


