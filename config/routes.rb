Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :events

  resources :attendances, only: [:create, :destroy]

  resources :invites, only: [:create, :destroy]
  # Defines the root path route ("/")
  root "events#index"
end
