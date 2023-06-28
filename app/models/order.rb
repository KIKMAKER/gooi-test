class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  # Validations
  validates :user_id, presence: true
  validates :quantity, presence: true

  # Other methods and callbacks
end
