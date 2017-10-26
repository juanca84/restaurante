module Api
  module V1
    class ClientesController < ApplicationController
      respond_to :json

      def index
        respond_with Cliente.all
      end
    end
  end
end
