class Api::ProductsController < ApplicationController


  def show 
    @product = Product.all
    render 'food_to_come.json.jb'
  end 

  def drop 
    @product = Product.first 
    render "food_to_send.json.jb"
  end 

  def store 
    @product = Product.last
    render "food_to_get_at_store.json.jb"
  end 


end
