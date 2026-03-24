WITH source AS (
    SELECT * FROM {{ source('staging_source', 'payments') }}
)

SELECT
    payment_id,
    session_id,
    customer_id,
    amount,
    payment_method,
    payment_time,
    status,
    ingestion_ts
FROM source