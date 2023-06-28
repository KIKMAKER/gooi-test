class Product < ApplicationRecord
  # Associations
  has_many :order_products
  has_many :orders, through: :order_products

  # Validations
  validates :name, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true

  # Custom Methods

  # Returns the total price of the product based on quantity
  def total_price
    quantity * price
  end

  # Returns true if the product is in stock
  def in_stock?
    quantity.positive?
  end

  # Returns a formatted description with additional details
  def formatted_description
    "Product: #{name}\nDescription: #{description}\nPrice: $#{price}\nQuantity: #{quantity}"
  end
end
