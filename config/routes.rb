Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"
  root to: 'home#index'

  resources :users, only: :create
  resources :rooms do
    resources :messages
  end

  delete 'logout'  => 'sessions#destroy'
  post 'login' => 'sessions#create'
end
