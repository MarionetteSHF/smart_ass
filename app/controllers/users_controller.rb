class UsersController < ApplicationController

    def show
        # id = @user.id # retrieve movie ID from URI route
        @user = User.find(params[:id])
    end
    def new
        # @user = User.new
    end
    
    def index

    end

    def create
        # || user_params[:password].empty? || user_params[:phone].empty? || user_params[:email].empty?
        @user = User.find_by(email: user_params[:email])
        if @user.present?
            flash[:notice] = "The email has been used"
            render "index"
            return
        end

        @user = User.find_by(phone: user_params[:phone])
        if @user.present?
            flash[:notice] = "The phone has been used"
            render "index"
            return
        end


        if user_params[:name].empty? || user_params[:password].empty? || user_params[:phone].empty? || user_params[:email].empty?
            flash[:notice] = "please fill in all information"
            
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

    def reset
        @user = User.find_by_id session[:user_id]
    end

    def update
        @user = User.find_by_id params[:id]
        if !user_params[:password].nil?
            
            if user_params[:password].empty? || user_params[:password_confirmation].empty?
                flash[:notice] = "Password cannot be empty."
                redirect_to reset_password_path(@user)
                return
            end
            
            if user_params[:password] == @user.password
                flash[:notice] = "The new password you entered is the same as your old password. Enter a different password."
                redirect_to reset_password_path(@user)
                return
            end

            if user_params[:password] != user_params[:password_confirmation]
                flash[:notice] = "Password didn't match."
                redirect_to reset_password_path(@user)
                return
            end

            password_params = Hash[:password => user_params[:password_confirmation]]
            if @user.update(password_params)
                flash[:notice] = "Your password was successfully updated."
                redirect_to profile_path(@user)
                return
            end
        end

        if user_params[:name].empty? || user_params[:email].empty? || user_params[:phone].empty?
            
            flash[:notice] = "Please fill in your name and contact below."
            redirect_to edit_user_path(@user)
            return
        end
        if @user.update(user_params)
            flash[:notice] = "Your information was successfully updated."
            redirect_to profile_path(@user)
        end

    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :description, :password_confirmation)
    end

end