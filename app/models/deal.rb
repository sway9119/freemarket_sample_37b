class Deal < ApplicationRecord
  belongs_to :item
  validates :user_id, presence: true
  validates :item_id, presence: true, uniqueness: true
end
