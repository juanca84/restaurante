class AddCantidadToDetallePedidos < ActiveRecord::Migration[5.1]
  def change
    add_column :detalle_pedidos, :cantidad, :integer
  end
end
