with src_reviews as(
    SELECT * FROM   {{ source('airbnb', 'reviews') }}
    --AIRBNB.RAW.raw_reviews
)
select 
    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
from src_reviews