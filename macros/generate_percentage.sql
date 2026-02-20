{% macro to_percentage(column_name, precision=2) %}
    round({{ column_name }}, {{ precision }})
{% endmacro %}