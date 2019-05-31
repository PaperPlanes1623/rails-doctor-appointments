Rails.application.routes.draw do
  root 'users#index'
 resources :users 

  resources :doctors do
    resources :appointments
  end
end
