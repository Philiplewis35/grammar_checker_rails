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

  devise_scope :user do
    authenticated :user do
      root 'home#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
