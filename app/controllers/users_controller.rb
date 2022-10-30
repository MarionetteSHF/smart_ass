class UsersController < ApplicationController
    

    def new
        # @user = User.new
    end
    
    def index
        @users = User.all
    end

    def create
        # puts params
        # user_params[:user_id] = User.set_user_id
        
        # puts user_params['name']
        # puts user_params['password']
        if user_params[:name].empty? or user_params[:password].empty? or user_params[:phone].empty? or user_params[:email].empty?
            flash.now[:register_error] = "please fill in all information"
            # redirect_to items_path
            render "index"
        end

        @user = User.create!(user_params)
        
        if @user.save
            # flash[:notice] = "#{@user.name} was successfully created"
            # redirect_to items_path
            redirect_to items_path
        end
 
        #     flash.now[:login_error] = "invalid username or password"
         
        #     render "new"
         
        # end
    end

    

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password)
    end

end