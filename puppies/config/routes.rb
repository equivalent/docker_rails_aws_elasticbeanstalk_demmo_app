require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :puppies, only: [] do
    member do
      post :like
    end
  end

  root 'puppies#index'
end
