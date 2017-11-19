Rails.application.routes.draw do
  root to: "lexemes#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  
  resources :users#, except: [:new]
  get '/sign_up' => 'users#new', as: 'sign_up'
 
  resources :examples
  resources :senses
  resources :lexemes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
