class Order < ApplicationRecord
  belongs_to :stock_item
  belongs_to :user
end
