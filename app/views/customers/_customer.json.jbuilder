json.extract! customer, :id, :name, :email, :details, :created_at, :updated_at
json.url customer_url(customer, format: :json)
