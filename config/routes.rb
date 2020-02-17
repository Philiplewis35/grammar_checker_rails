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
      get 'user/services', to: 'users#services', as: 'api_get_user_services'
    end
  end

end
