class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :check_login, except: %i[index]
  before_action :check_user_accessibility, only: %i[ edit update destroy ]

  #check log in
  def check_login
    @current_user = session[:user_id]
    if @current_user == nil
      redirect_to(login_path)
    end
  end

  def check_user_accessibility
    if @current_user != @item.user_id
      flash[:notice] = "You are not authorized to edit this item"
      redirect_to items_path
    end
  end

  # GET /items or /items.json
  def index
    @items = Item.all.with_attached_images
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find params[:id]
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find_by_id params[:id]
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = @current_user

    puts item_params[:images]

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

  # GET /items/category/:category
  def search_by_category
    cat = params[:category]
    if cat.empty? or cat.nil?
      flash[:notice] = "'#{@item.title}' has no category info"
      redirect_to items_path
    else
      @items = Item.search_by_category(cat)
      render 'index'
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
      params.require(:item).permit(:title, :description, :category, :price, :number, :neededItem, images: [])
    end
end
