class Invoice < ApplicationRecord
  # Associations
  belongs_to :subscription
  has_many :orders, through: :subscriptions

  # Validations
  validates :subscription_id, presence: true
  validates :date, presence: true

  # Custom Methods

  # Returns the total price of the order associated with the invoice
  def total_price
    order.price * order.quantity
  end
end
