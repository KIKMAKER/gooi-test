class Subscription < ApplicationRecord
  belongs_to :user
  has_many :collections
end
