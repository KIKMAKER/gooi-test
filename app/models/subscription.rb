class Subscription < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :orders, through: :collections

  enum status: %i[active pause]
  # make a method to change the status to pause as required by pick_ups (and a method that updates the pick_ups)
  enum plan: %i[once-off standard XL]
  enum collection_day: %i[sunday monday tuesday wednesday thursday friday saturday]

  validates :address, presence: true
  validates :user_id, presence: true
  validates :plan, presence: true
end
