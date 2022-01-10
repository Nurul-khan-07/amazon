class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @product = Product.all
    @product = Product.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    # binding.pry
    @product = Product.new
  end

  def create
    @product = Product.new(permit_product_params)
    # binding.pry
    if @product.save
      redirect_to products_path
      flash[:message] = "Product successfully created"
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(permit_product_params)
      redirect_to product_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # binding.pry
    @product.destroy
    redirect_to products_path
  end

  private
  def permit_product_params
    params.require(:product).permit(:pr_name, :pr_category, :pr_price, :pr_details)
  end
  def find_product
    @product = Product.find(params[:id])
  end
end

