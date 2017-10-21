json.extract! pedido, :id, :numero, :total, :mesa_id, :cliente, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
