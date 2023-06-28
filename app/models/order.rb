class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  # Validations
  validates :user_id, presence: true

  # Other methods and callbacks

  def add_product(product, quantity = 1)
    order_products.create(product: product, quantity: quantity)
  end

  def total_price
    order_products.sum { |order_product| order_product.product.price * order_product.quantity }
  end

end
