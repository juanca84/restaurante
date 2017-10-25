class AddQrToMesas < ActiveRecord::Migration[5.1]
  def change
    add_column :mesas, :qr, :string
  end
end
