json.extract! invoice, :id, :number, :date, :user_id, :customer_id, :saved_user, :saved_customer, :saved_bank_credentials, :status, :amount, :currency, :items, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
