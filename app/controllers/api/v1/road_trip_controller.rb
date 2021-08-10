class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !user.nil?
      road_trip = RoadTripFacade.roadtrip(params[:origin], params[:destination])
      if road_trip.nil?
        render json: ImpossibleRoadTripSerializer.impossible_road_trip(params[:origin], params[:destination])
      else
        coordinates = GeoCodeFacade.coordinates(params[:destination])
        weather_at_eta = ForcastFacade.road_trip_forcast(coordinates, road_trip.travel_time[0..1].to_i)
        render json: RoadTripSerializer.road_trip_and_forcast(road_trip, weather_at_eta)
      end
    else
      render json: {error: "Unauthorized"}, status: 401
    end
  end
end