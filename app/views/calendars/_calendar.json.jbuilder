json.extract! calendar, :id, :booking_id, :google_calendar_event_id, :start_time, :end_time, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)
