# frozen_string_literal: true

# top-level documentation!
class Api::ProductsController < ApplicationController
  def index
    # url = HTTP.get(https://code.org/schools.json)
    # response = JSON.parse(url)

    @product = Product.all

    render 'index.json.jb'
  end

  def show
    product =  params[:id]
    @product = Product.find_by(id: product)
    render 'show.json.jb'
  end 

  # def drop 
  #   @product = Product.first 
  #   render "food_to_send.json.jb"
  # end 

  # def store 
  #   @product = Product.last
  #   render "food_to_get_at_store.json.jb"
  # end 

  def create 

    @product = Product.new(
      name: params[:input_name], 
      price: params[:input_price],
      description: params[:input_description])
    # @product.save
    if @product.save
      render 'show.json.jb'
    else 
      render 'errors.json.jb', status: :unprocessable_entity
    end 

  end



  def update 

    @product = Product.find_by(id: params[:id])
    if @product.update(
    name: params[:input_name], price: params[:input_price],
    description: params[:input_description])
    # @product.save
      render 'show.json.jb'
    else
      render 'errors.json.jb', status: :unprocessable_entity
    end
  end

  def destroy


    @product = Product.find_by(id: params[:id])

    @product.destroy 

    render 'destroy.json.jb'
  end 



end 
