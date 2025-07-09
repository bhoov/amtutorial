#!/bin/bash
uv run nbdev_qmd_to_ipynb nbs/tutorial tutorial_ipynbs --copy_other_files False

# Copying tutorial figs to website
mkdir -p tutorial_ipynbs/assets/
cp -r nbs/tutorial/assets/* tutorial_ipynbs/assets/