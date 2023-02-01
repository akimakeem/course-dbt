{% macro unique_event_types() %} 

{% set get_event_type %}  
select distinct event_type from stg_postgres__events
{% endset %}

{% set results = run_query(get_event_type) %} 


{% if execute %}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }} -- return first column

{% endmacro %}