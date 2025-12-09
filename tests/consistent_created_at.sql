select * from {{ ref('dim_listings_cleansed') }} dl
 JOIN {{ ref('fct_reviews') }} ar 
USing (listing_id)
where dl.created_at >= ar.review_date