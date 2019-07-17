class Api::CartedProductsController < ApplicationController

  def index 

    @cartedproducts = CartedProduct.all

    if current_user 
      @cartedproducts = @cartedproducts.where(status: "carted")
    end 
    render 'index.json.jb'
  end 



  def create 
    @carted = CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity], 
      status: 'carted', 
      order_id: params[:order_id], 
      user_id: params[:user_id]
    )
    render 'show.json.jb'
  end 


  def destroy 
  @carted = CartedProduct.find_by(id: params[:id])
    @carted.status = "removed"
    @carted.save
    render 'destroy.json.jb'
  end
end 

