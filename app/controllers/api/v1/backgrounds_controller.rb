class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.background(params[:location])
  end
end