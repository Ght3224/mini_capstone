# frozen_string_literal: true

# top-level documentation!
class Api::ProductsController < ApplicationController

# before_action :authenticate_admin, except: [:create, :update]

  def index
    # @products = Product.all
    # if params[:search]
    #   @products = Product.where(
    #     'name LIKE ?', "%#{params[:search]}%"
    #   )
    # end
    # @products = @products.where('price < ?', 2) if params[:discount]
    # @products = @products.order(price: 'asc') if params[:sort]

    # @products = @products.order(params[:sort]) #=> params[:sort_order]


    @products = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end 

    render 'index.json.jb'
    # if params[:category]
    #   category = Category.find_by(name: params[:category])
    #   @products = category.products 
    # end
  end

  def show
    p 'i am current user'
    p current_user
    product =  params[:id]
    @product = Product.find_by(id: product)
    # render 'show.json.jb'
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
      description: params[:input_description]
    )
    # @product.save
    if @product.save
      render 'show.json.jb'
    else
      # render 'errors.json.jb', status: :unprocessable_entity
      {}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(
      name: params[:input_name], 
      price: params[:input_price],
      description: params[:input_description]
    )
      @product.save
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
