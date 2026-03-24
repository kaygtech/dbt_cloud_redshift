WITH source AS (
    SELECT * FROM {{ source('staging_source', 'parking_locations') }}
)

SELECT
    location_id,
    location_name,
    city,
    state,
    capacity,
    hourly_rate,
    active_flag,
    ingestion_ts
FROM source