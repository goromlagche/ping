class PingsController < ApplicationController
  def show
    render json: 'pong'
  end
end
