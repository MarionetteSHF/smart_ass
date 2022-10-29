class UsersController < ApplicationController
    

    def new
        @user = User.new
    end
    
    def index
        @users = User.all
    end

    def create
        puts params
        user_params[:user_id] = User.set_user_id
        
        @user = User.create!(user_params)
        if @user.save
            flash[:notice] = "#{@user.name} was successfully created"
            redirect_to user_path
        end
    end

    def login

    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def user_params
      params.require(:params).permit(:name, :email, :phone, :encrypted_password)
    end

end