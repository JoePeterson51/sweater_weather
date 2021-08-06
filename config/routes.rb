Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forcast, only: [:index]
    end
  end
end
