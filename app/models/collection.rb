class Collection < ApplicationRecord
  # Associations
  belongs_to :subscription
  has_many :orders, through: :subscriptions
  has_many :products, through: :orders

  # Validations
  validates :subscription_id, presence: true
  validates :date, presence: true

  # Scopes
  scope :recent, -> { order(date: :desc) }

  # Custom Methods

  # Returns the total quantity of the order associated with the collection
  def order_quantity
    order.quantity
  end

  # Returns the status of the subscription associated with the collection
  def subscription_status
    subscription.status
  end

  # Retrieves active subscriptions for Wednesday collection
  # def self.active_subscriptions_for_wednesday
  #   Subscription.where(collection_day: :wednesday, status: :active).includes(:collections)
  # end
end
#  # Associations
#  belongs_to :collection

#  # Validations
#  validates :time, presence: true
#  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
#  validates :bucket_type, presence: true

#  # Custom Methods

#  # Returns a formatted timestamp for the collection record
#  def formatted_timestamp
#    "#{date.strftime('%Y-%m-%d')} #{time.strftime('%H:%M:%S')}"
#  end

#  # Returns a string representation of the bucket details
#  def bucket_details
#    "Bucket Type: #{bucket_type}\nQuantity: #{bucket_quantity}"
#  end
