class Product < ApplicationRecord
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
end
