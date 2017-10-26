class Pedido < ApplicationRecord
  belongs_to :mesa
  belongs_to :cliente
  has_many :detalle_pedidos

  scope :recientes, -> { order('numero DESC') }
  scope :estados, -> { order('estado DESC') }
  scope :solicitados, -> { where(estado: 'SOLICITADO') }
  scope :atendidos, -> { where(estado: 'ATENDIDO') }

  before_create :asignar_numero

  def atender
    update_attributes(estado: 'ATENDIDO')
  end

  def atendido?
    estado == 'ATENDIDO'
  end

  def solicitado?
    estado == 'SOLICITADO'
  end

  def mesa_numero
    mesa.numero
  end

  def cliente_nombre
    cliente.nombre || 'NN'
  end

  def calcular_total
    total = 0
    detalle_pedidos.each do |detalle_pedido|
      total += detalle_pedido.menu.precio * detalle_pedido.cantidad
    end
    update_attributes(total: total)
  end

  private

  def asignar_numero
    maximo = Pedido.maximum :numero
    self.numero = maximo.present? ? maximo + 1 : 1
  end
end
