class ProductController < ApplicationController
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def permit_user_params
    params.require(:product).permit(:pr_name, :pr_category, :pr_price, :pr_details)
  end
  def find_product
    @product = Product.find(params[:id])
  end
end

