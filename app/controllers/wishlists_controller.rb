class WishlistsController < ApplicationController
    before_action :check_login, except:[:index]
    
    def check_login
        @current_user = session[:user_id]
        if @current_user = nil
          redirect_to(sessions_create_path)
        end
      end
    
      def index
        @user = User.find_by(id: params[:user_id])
        @item = Item.find_by(id: params[:item_id])
        @user_wishlists = @user.wishlists
    end
    
    # GET
    def new
        @user = User.find_by(id: params[:user_id])
        @wishlist = Wishlist.new
    end

    # POST /users/user_id/wishlist/create
    def create
        @user = User.find_by(id: params[:user_id])
        # @user = session[:user_id]
        @item = Item.find params[:id]
        @wishlist = Wishlist.new(wishlist_params)
        if @item.save
            flash[:notice] = "#{@item.title} was successfully added to wishlist"
            redirect_to item_path(@item)
        else
            flash[:notice] = @item.errors.full_messages[0]
            render 'new'
        end

        @user = User.find_by(id: params[:user_id])
        @wishlist = Wishlist.new(wishlist_params)
        @wishlist.user = @user
        if @wishlist.save
            redirect_to user_wishlist_path(@user, @wishlist)
        else
            render 'new'
        end
    end

    # GET /users/user_id/wishlist
    def show
        @user = User.find_by(id: params[:user_id])
        # @user = session[:user_id]
        @wishlist = Wishlist.find_by(id: params[:id])
    end

    def destroy
        Wishlist.find(params[:id]).destroy
        flash[:success] = "Wishlist deleted"
        redirect_to item_path(:wishlist_id => @wishlist.id)
    end

    private
    def wishlist_params
        params.require(:wishlist).permit(:item_id)
    end
end