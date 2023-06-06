class Collection < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :subscriptions
end
