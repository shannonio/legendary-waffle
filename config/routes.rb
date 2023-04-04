Rails.application.routes.draw do
  root to: 'gallery#index'

  resources :gallery, only: [:show], as: 'gallery_show'
  
  namespace :api do
    resources :search
  end
end

