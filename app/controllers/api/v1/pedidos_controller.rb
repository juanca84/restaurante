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
        @pedido = Pedido.new(pedido_params.to_hash)
        if @pedido.save
          DetallePedido.crear_detalles(@pedido.id, detalle_pedido_params.map(&:to_hash))
          render json: @pedido
        else
          render json: @pedido.errors
        end
      end

      def update
        respond_with Cliente.all
      end

      private

      def pedido_params
        params.require(:pedido).permit(:cliente_id, :mesa_id)
      end

      def detalle_pedido_params
        params.require(:detalle_pedido).map { |d| d.permit(:menu_id, :cantidad) }
      end
    end
  end
end
