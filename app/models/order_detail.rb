class OrderDetail < ApplicationRecord
  belongs_to :product_attribute
  belongs_to :order
end
