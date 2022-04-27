Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api do
    namespace :v1 do
      get "/geocode/route/time", to: "geocode#time"
      resources :geocode, only: [:show]
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :munchies, only: [:index]
      resources :users, only: [:create]
    end 
   end 
end
