class AddEstadoToPedidos < ActiveRecord::Migration[5.1]
  def change
    add_column :pedidos, :estado, :string, default: 'SOLICITADO'
  end
end
