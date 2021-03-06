Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forcast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :breweries, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :road_trip, only: [:create]
    end
  end
end
