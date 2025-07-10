.PHONY: deploy pypi

deploy:
	bash scripts/prep_website_deploy.sh

pypi:
	uv run python scripts/prep_pypi.py