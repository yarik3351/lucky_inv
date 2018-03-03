Rails.application.routes.draw do
  root 'invoices#index'
  get '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'
  delete '/logout' => 'sessions#logout'
  post '/login' => 'sessions#create'

  resources :customers
  resources :users
  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
