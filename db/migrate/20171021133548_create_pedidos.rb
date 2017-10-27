class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.integer :numero
      t.decimal :total, default: 0
      t.references :mesa, foreign_key: true
      t.references :cliente

      t.timestamps
    end
  end
end
