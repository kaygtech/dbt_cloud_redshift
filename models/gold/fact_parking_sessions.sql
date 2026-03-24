WITH sessions AS (
    SELECT * FROM {{ ref('slvr_parking_sessions') }}
),

payments AS (
    SELECT * FROM {{ ref('slvr_payments') }}
)

SELECT
    s.session_id,
    s.customer_id,
    s.location_id,
    s.vehicle_plate,
    s.start_time,
    s.end_time,
    s.total_hours,
    s.status,

    p.payment_id,
    p.amount,
    p.payment_method,
    p.payment_time,

    -- derived metrics
    (p.amount / NULLIF(s.total_hours,0)) AS revenue_per_hour

FROM sessions s
LEFT JOIN payments p
    ON s.session_id = p.session_id