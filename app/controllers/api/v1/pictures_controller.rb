class Api::V1::PicturesController < ApplicationController
  def index
    @pictures = Pokemon.pluck(:pictures).flatten.uniq
    render json: @pictures
  end
end
