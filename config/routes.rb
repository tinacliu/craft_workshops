Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :workshops, except: [:destroy] do
    resources :bookings, only: [:new, :create]
  end

  get 'profile', to: 'users#show', as: 'profile'
  # patch 'profile', to: 'users#update', as: 'edit_profile'
end
