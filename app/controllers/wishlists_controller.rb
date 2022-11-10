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
    def new
        @wishlist = Wishlist.new
    end

    # POST /waitlists
    def create
        # @user = User.find_by(id: session[:user_id])
        # @item = Item.find_by(id: item.id)
        row_params = {:user_id => session[:user_id], :item_id => params[:id]}
        @new_wish_row = Wishlist.create!(row_params)
        puts params[:id]
        puts session[:user_id]
        # @wishlist = Wishlist.new do |w|
        #     w.user_id = session[:user_id]
        #     w.item_id = :id
        # end
        if @new_wish_row.save
            flash[:notice] = " was successfully added to wishlist"
            redirect_to wishlists_path
        end
    end

    # # GET /wishlists
    # def show
    #     @user = User.find_by(id: params[:user_id])
    #     # @user = session[:user_id]
    #     @wishlist = Wishlist.find_by(id: params[:id])
    # end

    # DELETE /wishlists
    def destroy

        @wishlist = Wishlist.where(item_id: params[:id], user_id: session[:user_id]).first
        # @wishlist = Wishlist.find_by_id :id
        puts "here"
        puts @wishlist.user_id
        @wishlist.destroy
        flash[:success] = "Wishlist deleted"
        redirect_to wishlists_path
    end

    private
    def wishlist_params
        params.require(:wishlist).permit(:item_id)
    end
end