class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.all
  end

  def new
    # binding.pry
    @user = User.new
  end

  def create
    # @user = User.create
    User.create(permit_user_params)
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    # binding.pry
    @user = User.find(params[:id])
  end

  def update
    # binding.pry
    if @user.update(permit_user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # binding.pry
    # @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def permit_user_params
    params.require(:user).permit(:name, :email, :ph_no, :address)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
