class Subscription < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :orders, through: :collections

  enum status: %i[active pause]
  enum plan: %i[once-off standard XL]

  validates :address, presence: true
  validates :user_id, presence: true
  validates :plan, presence: true
end
