class UsersController < ApplicationController
    

    def new
        # @user = User.new
    end
    
    def index
        @users = User.all
    end

    def create
        # || user_params[:password].empty? || user_params[:phone].empty? || user_params[:email].empty?
        if user_params[:name].empty? || user_params[:password].empty? || user_params[:phone].empty? || user_params[:email].empty?
            flash.now[:register_error] = "please fill in all information"
            
            render "index"
            return
        end
        @user = User.create!(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to items_path
        end
    end

    def logout
        session[:user_id] =  nil
        redirect_to items_path
    end

    def edit
        @user = User.find_by_id session[:user_id]
    end

    def update
        @user = User.find_by_id session[:user_id]
        if @user.update(user_params)
            flash[:notice] = "#{@user.name} was successfully updated."
            redirect_to profile_path(@user)
        else
            render 'edit', :status=>422
        end

    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password)
    end

end