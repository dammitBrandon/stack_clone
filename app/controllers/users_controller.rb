class UsersController < ApplicationController
  def create
    @user = User.new(name: params[:user][:name], 
                     email: params[:user][:email],
                     password: params[:user][:password], 
                     password_confirmation: params[:user][:password_confirmation])
    if @user.save
      flash[:success] = "Registration Successful!"
      session[:id] = @user.id
      redirect_to root_path
    else 
      flash[:error] = "Registration Failed, please try again."
      redirect_to root_path
    end
  end
end



# respond_to do |format|
#     if @user.save
#       format.html { redirect_to @user, notice: 'User was successfully created.' }
#       format.js   {}
#       format.json { render json: @user, status: :created, location: @user }
#     else
#       format.html { render action: "new" }
#       format.json { render json: @user.errors, status: :unprocessable_entity }
#     end
#   end