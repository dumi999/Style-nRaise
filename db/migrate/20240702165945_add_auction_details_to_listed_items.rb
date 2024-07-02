class AddAuctionDetailsToListedItems < ActiveRecord::Migration[7.1]
  def change
    add_column :listed_items, :starting_price, :float
    add_column :listed_items, :end_time, :datetime
  end
end
