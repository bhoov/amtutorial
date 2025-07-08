# Contributing

From a technical perspective, this project is somewhat of an experiment built around `nbdev` and `quarto`'s plain text `.qmd` files instead of notebooks.

It's foundation is a fork of [`nbdev`](https://github.com/bhoov/nbdev/tree/qmd_support), which is (in my mind) the gold standard for python package literate developing with docs, tests, and source code all in one place. The advantage of .qmd files instead of notebooks is a tighter integration with AI and plain-text source documents that don't need the "cleanup" of traditional notebooks (for more details, see the active PR [here](https://github.com/AnswerDotAI/nbdev/pull/1521))

If you are interested in contributing, follow the instructions below.

The most important ground rule:

> **Do not directly edit anything in `src/`**. This code is automatically generated from the `.qmd` and `.ipynb` files in the `nbs/` directory

Additionally,
- Use `uv add DEP` or `uv add DEP --dev` to add dependencies to the project
- Because `uv` is not officially supported by nbdev, we have to manually add requirements to `settings.ini`


## Log

The following commands were used to initialize the project, more for reference than anything:

```bash
uv init --package amtutorial
cd amtutorial
uv venv --python 3.10.0
uv add nbformat nbclient ipykernel git+https://github.com/bhoov/nbdev.git@qmd_support --dev
source .venv/bin/activate
uv run ipython kernel install --user --env VIRTUAL_ENV $(pwd)/.venv --name=amtutorial
nbdev_new # Fill out requested details, see below to manually change default .ipynb files to .qmd files
nbdev_install && nbdev_install_hooks && uv add -e --dev amtutorial
nbdev_prepare # Turn all nbs into executable src
```

Then, changed default to .qmd files:
- Add `readme_nb = index.qmd` to `settings.ini`, remove `core.ipynb` and `index.ipynb`

Dependencies were added during development. Run `uv sync` to keep the environment up to date.