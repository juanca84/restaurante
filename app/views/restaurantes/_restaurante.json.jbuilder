json.extract! restaurante, :id, :nit, :nombre, :created_at, :updated_at
json.url restaurante_url(restaurante, format: :json)
