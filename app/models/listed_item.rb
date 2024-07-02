class ListedItem < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :starting_price, presence: true, numericality: { greater_than_or_equal_to: 5 }
  validates :brand, presence: true
  validates :category, presence: true
  validates :end_time, presence: true
end
