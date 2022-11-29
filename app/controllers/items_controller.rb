class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :check_login, except: %i[index]
  before_action :check_user_accessibility, only: %i[ edit update destroy ]

  #check log in
  def check_login
    @current_user = session[:user_id]
    if @current_user == nil
      return redirect_to(login_path)
    end
    @user = User.find(session[:user_id])
  end

  def check_user_accessibility
    if @current_user != @item.user_id
      flash[:notice] = "You are not authorized to edit this item"
      return redirect_to items_path
    end
  end

  # GET /items or /items.json
  def index
    id = session[:user_id]
    if id != nil
      @user = User.find(session[:user_id])
    end

    # @user = User.find(session[:user_id])
    category = params[:category]
    @items = Item.search_by_category(category)
    if @items.empty?
      @items = Item.all
    end
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find params[:id]
  end

  # GET /items/new
  def new
    @item = Item.new
    @category_list = Item.get_all_category()
  end

  # GET /items/1/edit
  def edit
    @item = Item.find_by_id params[:id]
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = @current_user

    if @item.save
      flash[:notice] = "#{@item.title} was successfully created"
      redirect_to item_path(@item)
    else
      flash[:notice] = @item.errors.full_messages[0]
      render 'new', :status=>422
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @item = Item.find params[:id]
    @item.images.purge
    if @item.update(item_params)
      flash[:notice] = "#{@item.title} was successfully updated."
      redirect_to item_path(@item)
    else
      render 'edit', :status=>422
    end

  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item = Item.find_by_id params[:id]
    @item.images.purge
    @item.destroy
    flash[:notice] = "Item '#{@item.title}' has been deleted"
    redirect_to items_path
  end

  # GET /category/:category
  def search_by_category
    cat = params[:category]
    @items = Item.search_by_category(cat)

    if @items.length > 0
      render 'index'
    else
      flash[:notice] = "Nothing found under this category"
      return redirect_to items_path
    end
  end

  def get_items_by_user
    @items = Item.search_by_user @current_user
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :category, :price, :number, images: [])
    end
end
