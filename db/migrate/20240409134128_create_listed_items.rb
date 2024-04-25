class CreateListedItems < ActiveRecord::Migration[7.1]
  def change
    create_table :listed_items do |t|
      t.float :price
      t.text :description
      t.string :brand
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
