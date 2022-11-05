class SessionsController < ApplicationController

  def new
 
  end
 
  
 
  def create
 
   @user = User.find_by(email: user_params[:email])
  
   if !!@user && @user.password == user_params[:password]

     session[:user_id] = user.id
     redirect_to items_path
    # render plain: sprintf("welcome, %s!", @user.name)
 
   else
 
    flash.now[:login_error] = "invalid username or password"
 
    render "new"
 
   end
 
  end
 
  
 
  private
 
   def user_params
 
    params.require(:session).permit(:email, :password)
 
   end
 
 end

