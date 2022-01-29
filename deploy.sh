#!/bin/bash

# Activate the virtualenv
source ./docs-env/bin/activate

# Deploy the documentation
mkdocs gh-pages

# Deactivate the virtual environment
deactivate