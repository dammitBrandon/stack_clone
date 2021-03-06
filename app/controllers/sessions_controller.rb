class SessionsController < ApplicationController


  def show
     @user = User.new
  end

  def new
    render template: 'sessions/show'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      flash[:login] = "Welcome"
      session[:id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Sign in failed, please try again."
      @user = User.new
      render template: 'sessions/show'
    end
  end

  def destroy
    session.clear
    flash[:logout] = "Logout Successful"
    redirect_to root_path
  end

end
