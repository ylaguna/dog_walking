Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dog_walk, only: [:index, :show, :update, :create]
    end
  end
end
