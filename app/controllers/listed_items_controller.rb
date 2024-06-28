class ListedItemsController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is authenticated

  # Create a new listed item
  def create
    @listed_item = current_user.listed_items.build(listed_item_params)
    if @listed_item.save
      redirect_to my_account_path, notice: 'Item was successfully listed.'
    else
      render :form, alert: 'Failed to list item.'
    end
  end

  def form
    @listed_item = ListedItem.new
  end

  private

  # Strong parameters for listed item creation
  def listed_item_params
    params.require(:listed_item).permit(:name, :description, :price, :brand, :category, :charity_id)
  end
end
