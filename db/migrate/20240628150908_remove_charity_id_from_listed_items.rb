class RemoveCharityIdFromListedItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :listed_items, :charity_id, :bigint
  end
end
