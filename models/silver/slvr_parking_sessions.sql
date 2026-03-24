WITH source AS (
    SELECT * FROM {{ source('staging_source', 'parking_sessions') }}
)

SELECT
    session_id,
    customer_id,
    location_id,
    vehicle_plate,
    start_time,
    end_time,
    total_hours,
    status,
    ingestion_ts
FROM source