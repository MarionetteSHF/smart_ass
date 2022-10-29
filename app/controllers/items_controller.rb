class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
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
  end

  # GET /items/1/edit
  def edit
    @item = Item.find_by_id params[:id]
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.title} was successfully created"
      redirect_to item_path(@item)
    else
      render 'new', :status=>422
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @item = Item.find params[:id]
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
    @item.destroy
    flash[:notice] = "Item '#{@item.title}' has been deleted"
    redirect_to items_path
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :category, :price, :number, :neededItem)
    end
end
