Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :services
  end

  resources :users do
    post :add_services
    post 'remove_service/:service_id', to: 'users#remove_service', as: 'remove_service'
  end

  root to: 'home#show'

end
