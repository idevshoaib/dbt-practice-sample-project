{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}

with src_reviews as (
    selecT * from {{ ref('src_reviews') }}
)
selecT 
{{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
    AS review_id,
* 
from src_reviews
where review_text is not null
{% if is_incremental() %}
    AND review_date > (selecT max(review_date) from {{ this }})
{% endif %}