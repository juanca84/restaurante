json.extract! cliente, :id, :nit, :nombre, :restaurante_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
