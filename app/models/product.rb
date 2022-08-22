class Product < ApplicationRecord
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
  has_many :product_images, dependent: :destroy

  scope :latest_product, ->{order created_at: :desc}
  delegate :name, to: :category, prefix: true

  def sum_quantity
    product_attributes.sum(:quantity)
  end
end
