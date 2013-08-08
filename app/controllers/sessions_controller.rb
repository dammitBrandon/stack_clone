class SessionsController < ApplicationController


  def show 
     @user = User.new
  end

  def new
    render template: 'sessions/show'
  end

  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome #{user.name}!"
      session[:id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Signin failed, please try again."
      redirect_to new
    end 
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  
end
