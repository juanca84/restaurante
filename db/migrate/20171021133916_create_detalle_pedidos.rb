class CreateDetallePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :detalle_pedidos do |t|
      t.references :pedido, foreign_key: true
      t.references :menu

      t.timestamps
    end
  end
end
