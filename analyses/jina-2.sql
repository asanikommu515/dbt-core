{% set fruits=['apple', 'banana', 'cherry'] %}

{%- for fruit in fruits -%}
  {{ fruit }} {% if not loop.last %}, {% endif %}
{% endfor %}


