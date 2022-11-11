class WishlistsController < ApplicationController
    before_action :check_login, except:[:index]
    
    def check_login
        @current_user = session[:user_id]
        if @current_user == nil
          redirect_to(sessions_create_path)
        end
    end
    
    # GET /wishlists
    def index
        @user = User.find_by(id: session[:user_id])
        @wishlist = Wishlist.where(user_id: session[:user_id])
        item_id_arr = []
        @wishlist.each do |w|
            item_id_arr.push(w.item_id)
        end
        @items = Item.where(id: item_id_arr)
    end
    
    # GET /waitlists/new
    # def new
        # @wishlist = Wishlist.new
    # end

    # POST /waitlists
    def create
        wishlist_params = {:user_id => session[:user_id], :item_id => params[:id]}
        @wishlist = Wishlist.create!(wishlist_params)
        @item = Item.find_by(id: params[:id])
        if @wishlist.save
            flash[:notice] = "#{@item.title} was successfully added to wishlist"
            redirect_to wishlists_path
        end
    end

    # # GET /wishlists
    # def show
    #     @user = User.find_by(id: session[:user_id])
    #     @wishlist = Wishlist.where(user_id: session[:user_id])
    # end

    # DELETE /wishlists
    def destroy
        @wishlist = Wishlist.where(item_id: params[:id], user_id: session[:user_id]).first
        @wishlist.destroy
        @item = Item.find_by(id: params[:id])
        flash[:notice] = "#{@item.title} was removed from wishlist"
        redirect_to wishlists_path
    end
end