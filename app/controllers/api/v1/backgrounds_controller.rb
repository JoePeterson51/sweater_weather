class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].present?
      background = BackgroundFacade.background(params[:location])
      if background.nil?
        render json: { error: "No Image Found" },  status: 404
      else
        render json: BackgroundSerializer.new(background).serializable_hash.to_json
      end
    else
      render json: { error: "Invalid Search" },  status: 400
    end
  end
end