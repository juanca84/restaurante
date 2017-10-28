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
        puts params
        @pedido = Pedido.new(eval(params[:pedido]))
        if @pedido.save
          DetallePedido.crear_detalles(@pedido.id, eval('[' + params[:detalle_pedido][0] + ']'))
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
        params.require(:pedido)
      end

      def detalle_pedido_params
        params.require(:detalle_pedido)
      end
    end
  end
end
