class Collection < ApplicationRecord
  # Associations
  belongs_to :subscription
  has_many :orders, through: :subscriptions
  has_many :products, through: :orders
  has_one :collection_record, dependent: :destroy

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
