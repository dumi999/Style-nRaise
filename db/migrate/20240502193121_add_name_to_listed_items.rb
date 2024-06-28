class AddNameToListedItems < ActiveRecord::Migration[7.1]
  def change
    add_column :listed_items, :name, :string
  end
end
