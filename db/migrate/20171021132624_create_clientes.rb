class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.string :nit
      t.string :nombre
      t.references :restaurante, foreign_key: true

      t.timestamps
    end
  end
end
