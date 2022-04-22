#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

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
