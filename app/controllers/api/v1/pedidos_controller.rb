module Api
  module V1
    class PedidosController < ApplicationController
      include ActionController::RequestForgeryProtection
      protect_from_forgery with: :exception, unless: -> { request.format.json? }
      respond_to :json

      def index
        respond_with Pedido.all.order('estado DESC, numero DESC')
      end

      def create
        if params[:pedido].present?
          detalle_pedidos = params[:pedido].extract!(:detalle_pedidos)
          pedido = Pedido.create!(params[:pedido])
          DetallePedido.crear_detalles(pedido.id, detalle_pedidos)
          respond_with respuesta: 'true'
        else
          respond_with 'false'
        end
      end

      def update
        respond_with Cliente.all
      end
    end
  end
end
