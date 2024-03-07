Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  resources :sessions, only: [:create]
  resources :users, only: [:create]
  resources :movies, only: [:index, :new, :create]
  resources :user_movies, only: [:create, :update]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  # Defines the root path route ("/")
  # root "posts#index"
end
