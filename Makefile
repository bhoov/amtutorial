.PHONY: preview deploy pypi

preview:
	uv run nbdev_preview

deploy:
	bash scripts/prep_website_deploy.sh

pypi:
	uv run python scripts/prep_pypi.py