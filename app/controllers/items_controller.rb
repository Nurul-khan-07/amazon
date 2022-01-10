class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(permit_item_params)
    redirect_to items_path
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private
  def permit_item_params
    params.require(:item).permit(:item_name, :item_cat, :item_price, :item_details)
  end
  def find_item
    @item = Item.find(params[:id])
  end
end
