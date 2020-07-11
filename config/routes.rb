Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clients do
    resources :commentaires, only: [ :new, :create ]
  end
  resources :chantiers do
    resources :taches
  end
  get '/dashboard', to:'dashboard#dashboard'

  get '/send-text', to:'clients#send_text'

end

