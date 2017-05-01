class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = :current_user
  end

  def create
    @user = User.new(user_params) 

    if @user.save
      session[:user_id] = @user.id
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
    params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :password_confirmation, :band_id)
  end

end