class ChangeCharityIdNullableInListedItems < ActiveRecord::Migration[7.1]
  def change
    change_column :listed_items, :charity_id, :bigint, null: true
  end
end
