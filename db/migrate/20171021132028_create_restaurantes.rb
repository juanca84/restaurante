class CreateRestaurantes < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurantes do |t|
      t.string :nit
      t.string :nombre

      t.timestamps
    end
  end
end
