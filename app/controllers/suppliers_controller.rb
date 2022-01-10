class SuppliersController < ApplicationController
  before_action :find_supplier, only: [:show, :edit, :update, :destroy]

  def index
    @supplier = Supplier.all
  end

  def new
    # binding.pry
    @supplier = Supplier.new
  end

  def create
    binding.pry
    Supplier.create(permit_supplier_params)
    redirect_to suppliers_path
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def update
    if @supplier.update(permit_supplier_params)
      redirect_to suppliers_index
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_path
  end

  private
  def permit_supplier_params
    params.require(:supplier).permit(:sup_name, :sup_email, :sup_phone, :address)
  end

  def find_supplier
    @supplier = Supplier.find(params[:id])
  end
end
