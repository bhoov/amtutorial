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
uv run nbdev_qmd_to_ipynb nbs/tutorial tutorial_ipynbs --copy_other_files False

# Recursively copy all raw .ipynb files to the tutorial_ipynbs if they don't start with `_`
# find nbs/ -name "*.ipynb" -not -name "_*" -exec sh -c '
#     for file do
#         # Get the relative path from nbs/
#         rel_path="${file#nbs/}"
#         # Create the target directory if it doesn't exist
#         target_dir="tutorial_ipynbs/$(dirname "$rel_path")"
#         mkdir -p "$target_dir"
#         # Copy the file
#         cp "$file" "tutorial_ipynbs/$rel_path"
#         echo "Copied $file to tutorial_ipynbs/$rel_path"
#     done
# ' sh {} +

# Copying tutorial figs to website
mkdir -p tutorial_ipynbs/assets/
cp -r nbs/tutorial/assets/* tutorial_ipynbs/assets/


echo "Done. Now you can run the following commands on the 'main' branch to deploy:"
echo ""
echo "    git add . && git commit -m \"Update site\" && git push"
echo ""
