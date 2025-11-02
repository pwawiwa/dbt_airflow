# Astro Runtime includes the following pre-installed provider packages:
# https://www.astronomer.io/docs/astro/runtime-image-architecture#provider-packages
FROM quay.io/astronomer/astro-runtime:10.3.0

RUN python -m venv dbt_venv && \
    . dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-snowflake && \
    deactivate