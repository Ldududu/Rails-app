class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_name: "default.png"
    )
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Rails App!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
end
