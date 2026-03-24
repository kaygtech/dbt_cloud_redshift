SELECT DISTINCT
    location_id,
    location_name,
    city,
    state,
    capacity,
    hourly_rate,
    active_flag
FROM {{ ref('slvr_parking_locations') }}