class AddCharityIdToListedItems < ActiveRecord::Migration[7.1]
  def change
    add_column :listed_items, :charity_id, :bigint
    add_foreign_key :listed_items, :charities
  end
end
