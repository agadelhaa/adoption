Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animals do
    resources :orders, only: [ :new, :create ]
  end

  resources :orders, only: [:edit, :update]
  resources :orders, only: [:destroy], as: :destroy
end
