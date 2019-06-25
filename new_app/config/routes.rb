Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
  #   get "/photos" => "photos#index"



  get 'function1' => 'example_pages#the_function1'

  get 'function2' => 'example_pages#the_function2'

  get 'function3' => 'example_pages#the_function3'

  
end 


end
