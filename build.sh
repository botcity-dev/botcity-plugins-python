#!/bin/bash

# Remove env if it exists
rm -rf docs-env

# Create a new virtual env for us to build the documentation
python -m venv -p python3 docs-env

# Activate the virtualenv
source ./docs-env/bin/activate

# Install the docs build dependencies
pip install -r docs-requirements.txt

# For each repo...
input="./repos.txt"
while IFS= read -r repo
do
  # Clone the codebase
  $(eval "git clone $repo")
  # Get the cloned folder name
  folder=${repo##*/}
  folder=${folder%????}
  # Install the plugin
  pip install $folder/.
done < "$input"

# Build the documentation
mkdocs build

# Deactivate the virtual environment
deactivate
