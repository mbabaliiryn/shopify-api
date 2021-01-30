class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def create
    product = Product.new(
      name: prod_params[:name],
      price: prod_params[:price],
      description: prod_params[:description]
    )
    if product.save
      render json: product, status: 200
    else
      render json: {error: "invalid params"}
    end
  end


  def show
    product = Product.find_by(id: params[:id])
    if product 
      render json: product, status: 200
    else
      render json: {error: "Product not available"}
    end
  end

  private
  def prod_params
    params.require(:product).permit([
      :name,
      :price,
      :description
    ])
  end
  end
  