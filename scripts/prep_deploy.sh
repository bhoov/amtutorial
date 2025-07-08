#!/bin/bash

# Run with `bash scripts/prep_deploy.sh`, paths are relative to the repo root

# Export the library
echo "Exporting library..."
uv run nbdev_export 

# Build the website
echo "Building website..."
uv run nbdev_docs

# Convert the tutorial notebooks to ipynb
echo "Converting tutorial notebooks to ipynb..."
uv run nbdev_qmd_to_ipynb nbs/tutorial _tutorial_ipynbs --copy_other_files False

echo "Done. Now you can run the following commands on the 'main' branch to deploy:"
echo ""
echo "    git add . && git commit -m \"Update site\" && git push"
echo ""
