#!/bin/bash

# Run with `bash scripts/prep_deploy.sh`, paths are relative to the repo root

# Export the library
echo "Exporting library..."
uv run nbdev_export 

# Sync dependencies
echo "Syncing dependencies..."
uv run python scripts/sync_dependencies.py

# Build the website
echo "Building website..."
uv run nbdev_docs

# Convert the tutorial notebooks to ipynb
echo "Converting tutorial notebooks to ipynb..."
bash scripts/export_qmd_as_ipynb.sh

echo "Done. Now you can run the following commands on the 'main' branch to deploy:"
echo ""
echo "    git add . && git commit -m \"Update site\" && git push"
echo ""
