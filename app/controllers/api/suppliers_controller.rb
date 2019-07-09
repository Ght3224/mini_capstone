class Api::SuppliersController < ApplicationController




    if params[:search]
      @suppliers = Supplier.where("name LIKE ?", "%#{params[:search]}%")

    else
      @suppliers = Supplier.all
    end


    if params[:discount]
      @suppliers = @suppliers.where('price < ?', 2)
    end 

    if params[:sort]
      @suppliers = @suppliers.order(:price => :asc)
    end 

    @suppliers = @suppliers.order(params[:sort]) #=> params[:sort_order]


    render 'index.json.jb'
  end

  def show
    supplier =  params[:id]
    @supplier = Supplier.find_by(id: supplier)
    render 'show.json.jb'
  end 


  def create 
    @supplier = Supplier.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description] )
    # @supplier.save
    if @supplier.save
      render 'show.json.jb'
    else
      render 'errors.json.jb', status: :unprocessable_entity
    end 
  end


  def update 

    @supplier = Supplier.find_by(id: params[:id])
    if @supplier.update(
    name: params[:input_name], price: params[:input_price],
    description: params[:input_description] )
     @supplier.save
      render 'show.json.jb'
    else
      render 'errors.json.jb', status: :unprocessable_entity
    end
  end

  def destroy


    @supplier = Supplier.find_by(id: params[:id])

    @supplier.destroy 

    render 'destroy.json.jb'
  end 



end
