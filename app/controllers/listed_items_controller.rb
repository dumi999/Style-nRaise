class ListedItemsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated
  before_action :set_listed_item, only: [:edit, :update, :destroy]

  # List all listed items
  def index
    @listed_items = current_user.listed_items
  end

  # Show a form to create a new listed item
  def new
    @listed_item = ListedItem.new
  end

  # Create a new listed item
  def create
    @listed_item = current_user.listed_items.build(listed_item_params)
    if @listed_item.save
      redirect_to my_account_path, notice: 'Item was successfully listed.'
    else
      render :new, alert: 'Failed to list item.'
    end
  end

  # Show form to edit a listed item
  def edit
  end

  # Update a listed item
  def update
    if @listed_item.update(listed_item_params)
      redirect_to my_account_path, notice: 'Item was successfully updated.'
    else
      render :edit, alert: 'Failed to update item.'
    end
  end

  # Delete a listed item
  def destroy
    @listed_item.destroy
    redirect_to my_account_path, notice: 'Item was successfully deleted.'
  end

  private

  # Set the listed item for edit, update, and destroy actions
  def set_listed_item
    @listed_item = current_user.listed_items.find(params[:id])
  end

  # Strong parameters for listed item creation and updating
  def listed_item_params
    params.require(:listed_item).permit(:name, :description, :price, :brand, :category, :charity_id)
  end
end
