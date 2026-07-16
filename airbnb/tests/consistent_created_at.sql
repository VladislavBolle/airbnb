WITH r_w_l AS (
    SELECT 
        f.listing_id AS fct_listing_id,
        l.listing_id AS dim_listing_id,
        review_date,
        created_at
FROM {{ ref('fct_reviews') }} f
LEFT JOIN {{ ref('dim_listings_cleansed') }} l ON f.listing_id = l.listing_id
)

SELECT 
    *
FROM r_w_l
WHERE review_date  < created_at
LIMIT 10