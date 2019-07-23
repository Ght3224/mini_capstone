class ProductsController < ApplicationController



  def index
    @products = Product.all

    render "index.html.erb"
  end 


  def show 
    @product = Product.find_by(id: params[:id])
  end 


  def new 
    @users = User.all 
    render 'new.html.erb'
  end 



  def create 

    @product = Product.new(
      name: params[:name],
      price: params[:price],
      # url: params[:url],
      description: params[:description])

   
    # render 'show.html.erb'
    redirect_to "/products/#{@product.id}"
  end 



  def edit 
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end 


  def update 
    @product = Product.find_by(id: params[:id])
    p params[:name]
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
      # supplier: params[:supplier]
      )
    @product.save
    redirect_to "/products/#{@product.id}"
  end 

  def destroy 
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"

  end 

end
