#!/bin/bash

input="./repos.txt"
while IFS= read -r repo
do
  git clone --depth=1 "$repo"
done < "$input"

mkdocs build
