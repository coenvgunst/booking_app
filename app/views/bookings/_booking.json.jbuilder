json.extract! booking, :id, :customer_id, :date, :time, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
