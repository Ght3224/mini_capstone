class Api::OrdersController < ApplicationController
  # before_action :authenticate_user

  def index 
    p "i am the current user"
    p current_user
    # if current_user
      @order = current_user.orders
    # else
    #   render json: {}, status: :unauthorized
    # end
    render 'index.json.jb'
  end



  def create
      p "hello"

       p 50 * 40  

    #find all the carted products in the shopping cart for the user who is logged in 
    #figure out how much each one will cost
    #add up all the price * quantities for a subtotal 


    # @cartedproducts = @cartedproducts.where(status: "carted")
    @carted_products = current_user.carted_products.where(status: 'carted')

     tax = 0 
     subtotal = 0 
      @carted_products.each do |carted_product|

          p carted_product.quantity * carted_product.product.price 

            subtotal+= carted_product.quantity * carted_product.product.price
            tax+= carted_product.quantity * carted_product.product.price

      end 




    total = subtotal + tax
    
    @order = Order.new(
            # quantity: params[:quantity],
            user_id: current_user.id,
            # product_id: params[:product_id],
            subtotal: subtotal,
            tax: tax,
            total: total
          )
    @order.save


    @carted_products.update(status: "purchased",
      order_id: @order.id)

    render 'show.json.jb'


  

    # render 'show.json.jb'



    # carted = current_user.carted_products.map{|product| product if product.status = "carted"}

    # @order = carted

    # @order = []

    # i = 0 
    # while i < carted.length
    #         tax = (params[:subtotal].to_f * 0.90.to_f)/(100.to_i)
    #         total =  tax.to_f + params[:subtotal].to_f
    #       @orders = Order.new(
    #         # quantity: params[:quantity],
    #         user_id: params[:user_id],
    #         # product_id: params[:product_id],
    #         subtotal: params[:subtotal],
    #         tax: tax,
    #         total: total
    #       )
    #       @orders.save
    #       @order << @orders
    #       i+=1
    # end 




    # i = 0 
    # while i < carted.length 
    #   carted[i].order_id = @order[i].id
    #   i+=1
    # end 

    # p carted.each{|cart| cart}

    # i = 0 
    # while i < carted.length 
    #   carted[i].status = "purchased"
    #   carted[i].save 
    #   i+=1
    # end 

    # # p carted.each{|cart| cart}


    # render 'index.json.jb'



  

    # if @order.save
    #   @order.carted_products.each{|product| product.status = "purchased"}
    # end 



     # if @order.save && @order.carted_products.status == "carted"
     #    @order = Order.new(subtotal: @order.subtotal, user_id: @order.user_id)
     #      # tax: @order.tax
     #      # total: @order.total)
     #    @order.save
     #    @order.carted_products.each{|product| 
     #      product.status = "purchased"}
     #    @order.carted_products.each{|product|product.order_id = @order.id}
     #  end 


   end




   def show
      p 'i am current user'
      p current_user
      order =  params[:id]
      @order = Order.find_by(id: order)
      render 'show.json.jb'
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


# protected

  
#   def order_params
#     params.permit(:subtotal, :quantity, :user_id, :product_id) # returns { :subtotal => x, :quanttiy => y, :user_id => z, :product_id => n }
#   end
end
