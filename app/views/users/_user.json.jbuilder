json.extract! user, :id, :email, :password, :name, :name_uk, :address, :address_uk, :phone, :bank_credentials, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
