
# dbt + Airflow DAGs

 production-minded Airflow DAGs to orchestrate a dbt project. Clear, small, and ready to wire into an Airflow environment.

What’s included
- `dags/` — Airflow DAG definitions (example: `dbt_dag.py`).
- `dags/dbt/` — example dbt project (source + compiled artifacts).
- `tests/` — lightweight DAG integrity tests.

Quick start (3 steps)
1. Install Python 3.10+, Airflow, and dbt (adapter-specific). Use a virtualenv.
2. Set required env vars:
	- `AIRFLOW_HOME` — Airflow runtime directory
	- `DBT_PROJECT_DIR` — optional (defaults to `dags/dbt/data_pipeline`)
3. Add Airflow connections used by the DAGs (example: `snowflake_conn`).

Security
- Never commit `profiles.yml`, credentials, or secrets. This repo excludes common local files and dbt artifacts via `.gitignore`.

Suggested repo name
- `dbt-airflow-dag`

If you want, I can: make `dags/dbt_dag.py` read `DBT_PROJECT_DIR` from env, add a short CONTRIBUTING section, and then commit & push everything.
