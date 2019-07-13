class Api::OrdersController < ApplicationController
  # before_action :authenticate_user
  def index 
    p "i am the current user"
    p current_user
    if current_user
      @orders = current_user.orders
    else
      render json: {}, status: :unauthorized
    end
    # render 'index.json.jb'
  end

   def show
      p 'i am current user'
      p current_user
      order =  params[:id]
      @order = Order.find_by(id: order)
      render 'show.json.jb'
    end

   def create
      tax = (params[:subtotal].to_f * 0.90.to_f)/(100.to_i)
      total =  tax.to_f + params[:subtotal].to_f
    @orders = Order.new(
      quantity: params[:quantity],
      user_id: params[:user_id],
      product_id: params[:product_id],
      subtotal: params[:subtotal],
      tax: tax,
      total: total
  )

     if @orders.save!
      # render json: {message: 'Order created successfully'}, status: :created
      render 'show.json.jb'
     else
      {}
     end
   end
end
