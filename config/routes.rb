# frozen_string_literal: true

Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #   get "/photos" => "photos#index"

    # get '/food_to_come' => "products#show"

    # get '/food_to_get_at_store' => "products#store"

    # get '/food_to_send/' => "products#drop"

    get '/products' => 'products#index'

    get '/products/:id' => 'products#show'

    post '/products' => 'products#create'

    patch '/products/:id' => 'products#update'

    delete '/products/:id' => 'products#destroy'

    get '/suppliers' => 'suppliers#index'

    get '/suppliers/:id' => 'suppliers#show'

    post '/suppliers' => 'suppliers#create'

    patch '/suppliers/:id' => 'suppliers#update'

    delete '/suppliers/:id' => 'suppliers#destroy'
    # sign up 
    post '/users' => 'users#create'
    #generate token
    post '/sessions' => 'sessions#create'
    # get '/users' => 'orders#users'

    post '/orders' => 'orders#create'

    get '/orders' => 'orders#index'
    get '/orders/:id' => 'orders#show'
    patch '/orders/:id' => 'orders#update'
    

    get '/carted_products' => 'carted_products#index'


    post '/carted_products' => 'carted_products#create'

    
    delete '/orders' => 'orders#destroy'
    delete 'carted_products/:id' => 'carted_products#destroy'
  end
    get '/products' => 'products#index'
    get '/products/new' => 'products#new'
    get '/products/:id' => 
    'products#show'
    post '/products/' => 'products#create'
    get '/products/:id/edit' => 'products#edit' 
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'
 end
