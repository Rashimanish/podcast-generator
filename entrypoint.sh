#!/bin/bash

echo "================="
echo "Configuring Git"
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_EMAIL}"
git config --global --add safe.directory /github/workspace

echo "Running feed generator"
python3 /usr/bin/feed.py

echo "Committing changes"
git add -A
git commit -m "Update Feed" || echo "No changes to commit"
git push --set-upstream origin main

echo "================="
