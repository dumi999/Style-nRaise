class Transaction < ApplicationRecord
  belongs_to :user
  has_many :listed_items
end
