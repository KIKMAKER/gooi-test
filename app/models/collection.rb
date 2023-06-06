class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  has_many :orders
end
