class PopulateAuctionDetailsInListedItems < ActiveRecord::Migration[7.1]
  def up
    ListedItem.update_all(starting_price: 5.0, end_time: Time.now + 7.days)
  end

  def down
    # No need to revert the data population
  end
end
