class SessionsController < ApplicationController

  def new
    
  end

  # def show
  #   # id = @user.id # retrieve movie ID from URI route
  #   # @user = User.find(session[:user_id])
  # end
 
  def create
   @user = User.find_by(email: user_params[:email])
   if !!@user && @user.password == user_params[:password]

     session[:user_id] = @user.id
     
     redirect_to items_path
    # render plain: sprintf("welcome, %s!", @user.name)
 
   else
 
    flash[:notice] = "invalid username or password"
 
    render "new"
 
   end
 
  end

  def omniauth
    info = request.env['omniauth.auth']
    useremail = info['info']['email']
    name = info['info']['first_name']
    if User.find_by(email: useremail)
      session[:user_id] = User.find_by(email: useremail).id
    else
      user = User.new
      user.email = useremail
      user.name = name
      if user.save
        session[:user_id] = user.id
      else
        flash[:notice] = "Cannot login with Oauth, user creation failed..."
      end
    end
    redirect_to items_path
  end
 
  
 
  private
 
   def user_params
 
    params.require(:session).permit(:email, :password)
 
   end
 
 end

