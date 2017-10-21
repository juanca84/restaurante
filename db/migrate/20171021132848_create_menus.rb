class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :codigo
      t.string :nombre
      t.decimal :precio
      t.references :restaurante, foreign_key: true

      t.timestamps
    end
  end
end
