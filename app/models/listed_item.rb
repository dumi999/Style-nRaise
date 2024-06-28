class ListedItem < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :brand, presence: true
  validates :category, presence: true
end
