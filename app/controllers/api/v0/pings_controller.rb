# frozen_string_literal: true

class Api
  class V0
    class PingsController < ApplicationController
      def index
        render json: { message: 'Pong' }
      end
    end
  end
end
