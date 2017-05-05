  class SessionsController < ApplicationController

    include ChessStoreHelpers::Cart

    def new
    end

    def create
      user = User.find_by_username(params[:username])
      create_cart
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_path, notice: "Logged in!"
      else
        flash.now.alert = "Username or password is invalid"
        render "new"
      end
    end

    def destroy
      destroy_cart
      session[:user_id] = nil
      redirect_to home_path, notice: "Logged out!"
    end

    def add_to_cart
      @item = Item.find(params[:id])
      add_item_to_cart(@item.id.to_s)
      flash[:notice] = 'Item was added to cart'
      redirect_to item_path(@item)
    end

  end