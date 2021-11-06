json.extract! database, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url database_url(database, format: :json)
