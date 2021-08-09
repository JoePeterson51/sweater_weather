class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.background(params[:location])
    render json: BackgroundSerializer.new(background).serializable_hash.to_json
  end
end