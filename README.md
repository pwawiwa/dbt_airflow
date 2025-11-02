# dbt + Airflow DAGs

Small, production-minded repository containing Airflow DAGs that orchestrate a dbt project. Designed to be simple to run locally and easy to wire into an existing Airflow deployment.

What this repo contains
- `dags/` — Airflow DAG definitions (including `dbt_dag.py`).
- `dags/dbt/` — example dbt project and compiled artifacts (target/ run/ compiled).
- `tests/` — unit tests for DAG integrity.

Quick start (local)
1. Install prerequisites: Python 3.10+, dbt (matching your adapter), and Airflow (recommended via constraints). Use a virtualenv.
2. Set required environment variables:
   - `AIRFLOW_HOME` — where Airflow stores DAGs and its DB (used by DAG code)
   - `DBT_PROJECT_DIR` — optional, path to the dbt project (defaults to `dags/dbt/data_pipeline`)
3. Create the Airflow connection(s) referenced by the DAGs (example):
   - Connection id: `snowflake_conn` — store Snowflake credentials in Airflow (do not hard-code in repo)
4. Activate your venv and run the DAGs via the Airflow scheduler/webserver or run tasks locally for testing.

Security and git
- Do NOT commit `profiles.yml`, credential files, or any secrets. This repo's `.gitignore` is configured to exclude typical local files (venvs, `profiles.yml`, dbt `target/` and `run/`, Airflow logs, etc.).

Recommended repo name
- `dbt-airflow-dag` — clear and searchable.

If you want, I can update `dags/dbt_dag.py` to read `DBT_PROJECT_DIR` from env and add a short CONTRIBUTING / deploy snippet explaining how to register Airflow connections and run tests.

License
- See repository license (if none, add one appropriate for your use).
Overview
========

Welcome to Astronomer! This project was generated after you ran 'astro dev init' using the Astronomer CLI. This readme describes the contents of the project, as well as how to run Apache Airflow on your local machine.

Project Contents
================

Your Astro project contains the following files and folders:

- dags: This folder contains the Python files for your Airflow DAGs. By default, this directory includes one example DAG:
    - `example_astronauts`: This DAG shows a simple ETL pipeline example that queries the list of astronauts currently in space from the Open Notify API and prints a statement for each astronaut. The DAG uses the TaskFlow API to define tasks in Python, and dynamic task mapping to dynamically print a statement for each astronaut. For more on how this DAG works, see our [Getting started tutorial](https://www.astronomer.io/docs/learn/get-started-with-airflow).
- Dockerfile: This file contains a versioned Astro Runtime Docker image that provides a differentiated Airflow experience. If you want to execute other commands or overrides at runtime, specify them here.
- include: This folder contains any additional files that you want to include as part of your project. It is empty by default.
- packages.txt: Install OS-level packages needed for your project by adding them to this file. It is empty by default.
- requirements.txt: Install Python packages needed for your project by adding them to this file. It is empty by default.
- plugins: Add custom or community plugins for your project to this file. It is empty by default.
- airflow_settings.yaml: Use this local-only file to specify Airflow Connections, Variables, and Pools instead of entering them in the Airflow UI as you develop DAGs in this project.

Deploy Your Project Locally
===========================

Start Airflow on your local machine by running 'astro dev start'.

This command will spin up five Docker containers on your machine, each for a different Airflow component:

- Postgres: Airflow's Metadata Database
- Scheduler: The Airflow component responsible for monitoring and triggering tasks
- DAG Processor: The Airflow component responsible for parsing DAGs
- API Server: The Airflow component responsible for serving the Airflow UI and API
- Triggerer: The Airflow component responsible for triggering deferred tasks

When all five containers are ready the command will open the browser to the Airflow UI at http://localhost:8080/. You should also be able to access your Postgres Database at 'localhost:5432/postgres' with username 'postgres' and password 'postgres'.

Note: If you already have either of the above ports allocated, you can either [stop your existing Docker containers or change the port](https://www.astronomer.io/docs/astro/cli/troubleshoot-locally#ports-are-not-available-for-my-local-airflow-webserver).

Deploy Your Project to Astronomer
=================================

If you have an Astronomer account, pushing code to a Deployment on Astronomer is simple. For deploying instructions, refer to Astronomer documentation: https://www.astronomer.io/docs/astro/deploy-code/

Contact
=======

The Astronomer CLI is maintained with love by the Astronomer team. To report a bug or suggest a change, reach out to our support.
