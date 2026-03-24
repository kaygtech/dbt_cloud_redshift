SELECT DISTINCT
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    created_at
FROM {{ ref('slvr_customers') }}