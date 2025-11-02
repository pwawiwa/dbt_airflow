# dbt-Airflow Data Pipeline

## Overview
production-grade data pipeline using Apache Airflow and dbt (Data Build Tool), targeting Snowflake as the data warehouse. The system orchestrates extraction, transformation, and loading (ETL) of data, enforces data quality, and produces analytics-ready tables for downstream consumption.

## Architecture
- **Orchestration:** Apache Airflow manages workflow scheduling, execution, and monitoring via DAGs (Directed Acyclic Graphs).
- **Transformation:** dbt models define SQL-based transformations, staging, and marts layers for business logic and reporting.
- **Data Warehouse:** Snowflake is used as the backend for data storage and computation.
- **Containerization:** Docker is used for environment isolation and reproducibility.

## Key Components

### Airflow DAGs
- `dags/dbt_dag.py`: Main DAG for running dbt models on a schedule using the `cosmos` library and Snowflake connection.
- `dags/exampledag.py`: Example DAG demonstrating Python-based ETL and dynamic task mapping.

### dbt Project Structure
- `dags/dbt/data_pipeline/`: Contains dbt models, macros, tests, and configuration files.
  - **Models:**
    - `models/staging/`: Raw data extraction and cleaning from Snowflake sample sources (`tpch.orders`, `tpch.lineitem`).
    - `models/marts/`: Business logic, aggregations, and fact tables (e.g., `fct_orders.sql`).
  - **Macros:** Reusable SQL logic (e.g., `macros/pricing.sql` for discount calculations).
  - **Tests:** Data quality checks (uniqueness, relationships, accepted values).
  - **Configuration:** `dbt_project.yml`, `packages.yml`, `package-lock.yml`.

### SQL Model Highlights
- **Staging Models:**
  - Extract and clean raw data from Snowflake sample tables.
  - Example: `stg_tpch_orders.sql` selects and renames columns from `tpch.orders`.
- **Marts Models:**
  - Join and aggregate staging data to produce business metrics.
  - Example: `int_order_items.sql` calculates item discounts using a custom macro.
  - `fct_orders.sql` produces a fact table with sales and discount metrics.
- **Macros:**
  - `pricing.sql`: Implements reusable logic for calculating discounted amounts.
- **Tests:**
  - SQL and YAML tests validate data integrity, relationships, and business rules.

## Setup & Usage

### Prerequisites
- Docker
- Python 3.8+
- Snowflake account and credentials

### Installation
1. Clone the repository:
   ```sh
   git clone <repo-url>
   cd dbt-dag
   ```
2. Build and start the Docker environment:
   ```sh
   docker build -t dbt-airflow .
   docker run -it --rm dbt-airflow
   ```
3. Install Python dependencies:
   ```sh
   pip install -r requirements.txt
   ```

### Running the Pipeline
1. Configure Airflow and Snowflake connection credentials.
2. Start Airflow scheduler and webserver.
3. Trigger the DAG (`dbt_dag`) via Airflow UI or CLI.
4. dbt models will be run, transforming and loading data into Snowflake.

### dbt Commands
- Run models:
  ```sh
  dbt run
  ```
- Test models:
  ```sh
  dbt test
  ```

## Data Quality & Testing
- dbt tests validate uniqueness, relationships, and accepted values on key columns.
- Custom SQL tests check for business logic errors (e.g., invalid dates, missing discounts).
- Airflow DAG tests ensure proper configuration and error-free imports.

## Project Structure
```
dags/
  dbt_dag.py
  exampledag.py
  dbt/
    data_pipeline/
      dbt_project.yml
      models/
        staging/
        marts/
      macros/
      tests/
      ...
requirements.txt
Dockerfile
README.md
```

## License
See individual package and macro licenses for details.

## Maintainers
Contact the repository owner for support or contributions.
