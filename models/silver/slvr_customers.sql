WITH source AS (
    SELECT * FROM {{ source('staging_source', 'customers') }}
)

SELECT
    customer_id,
    TRIM(first_name)      AS first_name,
    TRIM(last_name)       AS last_name,
    LOWER(email)          AS email,
    phone,
    created_at::timestamp AS created_at,
    ingestion_ts
FROM source