json.extract! customer, :id, :name, :email, :phone_number, :created_at, :updated_at
json.url customer_url(customer, format: :json)
