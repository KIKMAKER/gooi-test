class CollectionRecord < ApplicationRecord
  # Associations
  belongs_to :collection

  # Validations
  validates :time, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bucket_type, presence: true

  # Custom Methods

  # Returns a formatted timestamp for the collection record
  def formatted_timestamp
    "#{date.strftime('%Y-%m-%d')} #{time.strftime('%H:%M:%S')}"
  end

  # Returns a string representation of the bucket details
  def bucket_details
    "Bucket Type: #{bucket_type}\nQuantity: #{bucket_quantity}"
  end
end
