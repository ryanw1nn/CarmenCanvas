Rails.application.routes.draw do
  resources :presentation_events do
    resources :evaluations, only: [:new, :create, :destroy]
  end
  resources :users, only: [:create, :destroy, :update]

  get '/grading_view', to: 'presentation_events#index_with_stats', as: 'grading_view'

  root 'presentation_events#index'

  get '/presentation_events/:id/join', to: 'presentation_events#join', as: :join_presentation_event

  get '/presentation_events/:id/leave', to: 'presentation_events#leave', as: :leave_presentation_event

  #NEW STUFF

  # Restricted routes
  resources :restricted, only: [:index]
  
  # Signup routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  # Login routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  #Logout routes
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/logout', to: 'sessions#destroy'
  # post '/logout', to: 'sessions#destroy'
end
