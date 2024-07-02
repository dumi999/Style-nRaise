class ListedItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listed_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @listed_items = ListedItem.all
  end

  def show
  end

  def new
    @listed_item = current_user.listed_items.build
  end

  def create
    @listed_item = current_user.listed_items.build(listed_item_params)
    if @listed_item.save
      redirect_to listed_items_path, notice: 'Listed item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @listed_item.update(listed_item_params)
      redirect_to @listed_item, notice: 'Listed item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listed_item.destroy
    redirect_to listed_items_path, status: :see_other
  end

  def my_items
    @listed_items = current_user.listed_items
  end

  private

  def set_listed_item
    @listed_item = ListedItem.find_by(id: params[:id])
    unless @listed_item
      flash[:alert] = "No listed item found with ID #{params[:id]}"
      redirect_to listed_items_path
    end
  end

  def correct_user
    @listed_item = current_user.listed_items.find_by(id: params[:id])
    redirect_to listed_items_path, alert: 'Not authorized to edit this item' if @listed_item.nil?
  end

  def listed_item_params
    params.require(:listed_item).permit(:name, :description, :price, :brand, :category, :starting_price, :end_time)
  end
end
