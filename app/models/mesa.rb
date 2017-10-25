class Mesa < ApplicationRecord
  belongs_to :restaurante

  def restaurante_nombre
    restaurante.nombre
  end
end
