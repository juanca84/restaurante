json.extract! detalle_pedido, :id, :pedido_id, :menu, :created_at, :updated_at
json.url detalle_pedido_url(detalle_pedido, format: :json)
