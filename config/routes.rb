Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clients do
    resources :commentaires, only: [ :new, :create ]
  end
  resources :chantiers do
    resources :taches
  end
  get '/dashboard', to:'dashboard#dashboard'

end

