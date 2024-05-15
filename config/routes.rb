Rails.application.routes.draw do
  get 'comments/create'
  get 'stories/index'
  get 'stories/show', to: 'stories#show'
 # config/routes.rb

resources :stories

  resources :stories do
    resources :comments, only: [:create] do
    member do
      get 'reply', to: 'comments#new_reply'
    end
  end
end
  
 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "stories#index"
end
