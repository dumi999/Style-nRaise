class CreateBids < ActiveRecord::Migration[7.1]
  def change
    create_table :bids do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listed_item, null: false, foreign_key: true
      t.float :amount, null: false

      t.timestamps
    end
  end
end
