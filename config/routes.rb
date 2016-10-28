Rails.application.routes.draw do

  resources :pages, only: [:index, :create]

  root to: 'pages#index'
end
