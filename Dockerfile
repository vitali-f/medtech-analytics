FROM apache/airflow:2.7.1-python3.10

USER root
# Устанавливаем зависимости для dbt, если понадобятся системные библиотеки
RUN apt-get update && apt-get install -y git && apt-get clean

USER airflow
# Устанавливаем dbt-snowflake. Версию фиксируем для стабильности.
RUN pip install --no-cache-dir dbt-snowflake==1.7.1