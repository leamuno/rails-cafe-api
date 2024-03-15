Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pokemons, only: [ :index, :create ]
      resources :pictures, only: [ :index ]
    end
  end
end
