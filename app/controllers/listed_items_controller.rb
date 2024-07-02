class ListedItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listed_item = ListedItem.all
  end

  def show
    @listed_item = ListedItem.find_by(id: params[:id])

    if @listed_item
      # Listed item found, render show template
    else
      flash[:alert] = "No listed item found with ID #{params[:id]}"
      redirect_to listed_items_path
    end
  end

  def new
    @listed_item = ListedItem.new
  end

  def create
    @listed_item = current_user.listed_items.new(listed_item_params)

    if @listed_item.save
      redirect_to listed_items_path, notice: 'Listed item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @listed_item = ListedItem.find(params[:id])
  end

  def update
    @listed_item = ListedItem.find(params[:id])

    if @listed_item.update(listed_item_params)
      redirect_to @listed_item, notice: 'Listed item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listed_item = ListedItem.find(params[:id])
    @listed_item.destroy

    redirect_to listed_item_path, status: :see_other
  end

  private

  def listed_item_params
    params.require(:listed_item).permit(:name, :description, :price, :brand, :category)
  end
end
