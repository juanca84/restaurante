class DetallePedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :menu

  after_save :actualizar_total_pedido

  def actualizar_total_pedido
    pedido.calcular_total
  end

  def self.crear_detalles(pedido_id, detalle_pedidos)
    detalle_pedidos.each do |detalle_pedido|
      detalle_pedido[:pedido_id] = pedido_id
      DetallePedido.create!(detalle_pedido)
    end
  end
end
