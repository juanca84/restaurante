module Api
  module V1
    class MenusController < ApplicationController
      respond_to :json

      def index
        respond_with Menu.all
      end
    end
  end
end
