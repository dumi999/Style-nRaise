class ListedItem < ApplicationRecord
  belongs_to :user
  # belongs_to :charity, optional: true # Allow charity_id to be nil (commented out for clarity)

  validates :name, :description, :price, :brand, :category, presence: true
  validates :price, numericality: { only_float: true, greater_than_or_equal_to: 9.99 }
end
