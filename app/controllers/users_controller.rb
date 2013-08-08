class UsersController < ApplicationController
  def create
    @user = User.new(name: params[:user][:name], 
                     email: params[:user][:email],
                     password: params[:user][:password], 
                     password_confirmation: params[:user][:password_confirmation])
    if @user.save
      flash[:success] = "Registration Successful!"
      redirect_to root_path
    else 
      flash[:error] = "Registration Failed, please try again."
      redirect_to root_path
    end
  end

end
