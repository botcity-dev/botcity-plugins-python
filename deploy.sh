#!/bin/bash

# Activate the virtualenv
source ./docs-env/bin/activate

# Deploy the documentation
mkdocs gh-deploy

# Deactivate the virtual environment
deactivate
