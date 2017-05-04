  class SessionsController < ApplicationController

    include ChessStoreHelpers::Cart

    def new
    end

    def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_path, notice: "Logged in!"
      else
        flash.now.alert = "Username or password is invalid"
        render "new"
      end
      if user.role? :customer
        create_cart
      end
    end

    def destroy
      if user.role? :customer
        destroy_cart
      end
      session[:user_id] = nil
      redirect_to home_path, notice: "Logged out!"
    end


  end