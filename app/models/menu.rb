class Menu < ApplicationRecord
  belongs_to :restaurante

  def restaurante_nombre
    restaurante.nombre
  end
end
