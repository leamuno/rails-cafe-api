class Api::V1::TypesController < ApplicationController
  def index
    @types = Pokemon.pluck(:types).flatten.uniq
    render json: @types
  end
end
