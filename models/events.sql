WITH string_events AS
(
    SELECT body::string as string_body, * FROM {{ source('default', 'raw_events') }}
)
SELECT 
    string_body:["context"]["id"] as context_id,
    string_body:["entity_id"],
    string_body:["state"], 
    string_body:["attributes"]["device_class"], 
    string_body:["attributes"]["unit_of_measurement"],
    string_body:["last_updated"]::timestamp ,
    string_body:["last_changed"]::timestamp ,
    enqueuedTime::timestamp
FROM string_events
