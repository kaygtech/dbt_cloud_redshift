SELECT
    l.location_id,
    l.location_name,
    l.city,
    l.state,

    DATE_TRUNC('day', f.start_time) AS session_date,

    COUNT(DISTINCT f.session_id) AS total_sessions,
    SUM(f.amount) AS total_revenue,
    AVG(f.total_hours) AS avg_session_hours,

    
    COUNT(DISTINCT f.session_id) / NULLIF(MAX(l.capacity), 0) AS utilization_rate,

    SUM(f.amount) / NULLIF(SUM(f.total_hours), 0) AS revenue_per_hour

FROM {{ ref('fact_parking_sessions') }} f
JOIN {{ ref('dim_parking_locations') }} l
    ON f.location_id = l.location_id

GROUP BY
    l.location_id,
    l.location_name,
    l.city,
    l.state,
    DATE_TRUNC('day', f.start_time)