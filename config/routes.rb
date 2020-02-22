Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :admin do
    resources :services
  end

  resources :users do
    get :services
    post :add_services
    post 'remove_service/:service_id', to: 'users#remove_service', as: 'remove_service'
  end

  root to: 'home#show'

  namespace :api do
    namespace :v1 do
      post 'sign_in', to: 'sessions#create', as: 'sign_in'
      delete 'sign_out/', to: 'sessions#destroy', as: 'sign_out'
      get 'session_status', to: 'sessions#session_status', as: 'status'
      get 'services', to: 'services#index', as: 'services'
    end
  end

end
