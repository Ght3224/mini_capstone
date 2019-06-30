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

  end
end
