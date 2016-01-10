Rails.application.routes.draw do

  resources :cars
  resources :pics
  devise_for :users

  root to: 'pages#index'

  get 'vehicles' => 'cars#vehicles'
  # get 'vehicles/:unique'  => 'cars#vehicle'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-of-service' => 'pages#terms_of_service'

   match 'vehicles/:unique' => 'cars#vehicle', :as => :vehicle, :via => [:post, :get]
end
