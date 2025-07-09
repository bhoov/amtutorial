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
uv run nbdev_qmd_to_ipynb nbs/tutorial tutorial_ipynbs --copy_other_files False

# Copying tutorial figs to website
mkdir -p tutorial_ipynbs/assets/
cp -r nbs/tutorial/assets/* tutorial_ipynbs/assets/

echo "Done. Now you can run the following commands on the 'main' branch to deploy:"
echo ""
echo "    git add . && git commit -m \"Update site\" && git push"
echo ""
