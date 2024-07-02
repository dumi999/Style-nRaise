class AddNotNullConstraintToAuctionDetails < ActiveRecord::Migration[7.1]
  def change
    change_column_null :listed_items, :starting_price, false
    change_column_null :listed_items, :end_time, false
  end
end
