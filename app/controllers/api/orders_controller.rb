class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index 
    p "i am the current user"
    p current_user
    # if current_user
      @orders = current_user.orders
    # else
    #   render json: {}, status: :unauthorized
    # end
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
    @order = Order.new(
      quantity: params[:quantity],
      user_id: params[:user_id],
      product_id: params[:product_id],
      subtotal: params[:subtotal],
      tax: tax,
      total: total
  )
     if @order.save!
      # render json: {message: 'Order created successfully'}, status: :created
      render 'show.json.jb'
     else
      {}
     end
   end

# def create
#     @order = Order.new(order_params)
#     @order.tax = (@order.subtotal.to_f * 0.90.to_f)/(100.to_i)
#     @order.total = @order.tax.to_f + @order.subtotal.to_f

#      if @order.save!
#       # render json: {message: 'Order created successfully'}, status: :created
#       render 'show.json.jb'
#      else
#       {}
#      end
#    end





  def update 
    tax = (params[:subtotal].to_f * 0.90.to_f)/(100.to_i)
      total =  tax.to_f + params[:subtotal].to_f
    @order = Order.find_by(id: params[:id])
    if @order.update(quantity: params[:quantity],
      user_id: params[:user_id],
      product_id: params[:product_id],
      subtotal: params[:subtotal],
      tax: tax,
      total: total
  )
      @order.save
      render 'show.json.jb'
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end


  def destroy 
    @order = Order.find(params[:id])
    if @order.destroy
      head :ok
    else 
      head :unprocessable_entity
    end 

  end 


protected

  
  def order_params
    params.permit(:subtotal, :quantity, :user_id, :product_id) # returns { :subtotal => x, :quanttiy => y, :user_id => z, :product_id => n }
  end
end
