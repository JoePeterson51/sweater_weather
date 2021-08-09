Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forcast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :breweries, only: [:index]
    end
  end
end
