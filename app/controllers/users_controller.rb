class UsersController < ApplicationController

  authorize_resource

  include ChessStoreHelpers::Cart

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.active.employees.all
  end

  def create
    @user = User.new(user_params) 

    if @user.save
      session[:user_id] = @user.id
      create_cart
      redirect_to(home_path, :notice => 'User was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @user = :current_user
    if @user.update_attributes(user_params)
      redirect_to(@user, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :phone ,:role, :password, :password_confirmation)
  end

end