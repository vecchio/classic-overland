Rails.application.routes.draw do

  resources :cars
  devise_for :users

  root to: 'pages#index'

  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-of-service' => 'pages#terms_of_service'

end
