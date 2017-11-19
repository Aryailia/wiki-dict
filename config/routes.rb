Rails.application.routes.draw do
  root to: "lexemes#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  
  resources :users#, except: [:new]
  get '/sign_up' => 'users#new', as: 'sign_up'
  patch '/promote/:id' => 'users#promote', as: 'promote'
 
  resources :lexemes
  get '/search' => 'lexemes#search', as: 'search'
  
  resources :senses, only: [:create, :update, :destroy]
  patch '/approve/:id' => 'senses#approve', as: 'approve'
  
  resources :examples
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
