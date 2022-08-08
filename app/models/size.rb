class Size < ApplicationRecord
  has_many :product_attributes, dependent: :destroy
end
