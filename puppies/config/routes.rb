Rails.application.routes.draw do
  resources :puppies, only: [] do
    member do
      post :like
    end
  end

  root 'puppies#index'
end
