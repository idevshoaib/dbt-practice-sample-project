{% test minimum_row_count(model, min_row_count) %}
{{ config(severity='warn') }}
select count(*) as cnt 
    from {{ model }}
Having count(*) < {{ min_row_count }}
{% endtest %}