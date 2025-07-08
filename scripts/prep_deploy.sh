#!/bin/bash

# Run with `bash scripts/prep_deploy.sh`, paths are relative to the repo root

# Run the commands
uv run nbdev_export 
uv run nbdev_docs
bash scripts/prep_colab_nbs.sh
# git add . 
# git commit -m "Update site" && git push
