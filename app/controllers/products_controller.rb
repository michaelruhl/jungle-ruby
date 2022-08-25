class ProductsController < ApplicationController
  http_basic_authenticate_with :name => "jungle", :password => "book" 

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
