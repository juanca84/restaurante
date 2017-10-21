class CreateMesas < ActiveRecord::Migration[5.1]
  def change
    create_table :mesas do |t|
      t.integer :numero
      t.references :restaurante, foreign_key: true

      t.timestamps
    end
  end
end
