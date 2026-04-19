from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'vitali',
    'start_date': datetime(2026, 4, 19),
    'retries': 1,
}

with DAG(
    'medtech_analytics_pipeline',
    default_args=default_args,
    schedule_interval='@daily',
    catchup=False
) as dag:

    # Тестируем соединение с Snowflake
    check_dbt = BashOperator(
        task_id='dbt_debug',
        bash_command='cd /opt/airflow/dbt_project && dbt debug'
    )

    # Запускаем модели трансформации
    run_models = BashOperator(
        task_id='dbt_run',
        bash_command='cd /opt/airflow/dbt_project && dbt run'
    )

    check_dbt >> run_models