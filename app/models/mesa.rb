class Mesa < ApplicationRecord
  belongs_to :restaurante

  before_create :generar_qr

  def restaurante_nombre
    restaurante.nombre
  end

  def generar_qr
    require 'rqrcode'
    self.qr = RQRCode::QRCode.new("#{restaurante_id}|#{id}", size: 4, level: :h)
  end
end
