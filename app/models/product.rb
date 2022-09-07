class Product < ApplicationRecord
  PARAMS_PRODUCTS = %i(
    name description category_id
    product_attributes_attributes: [:id size_id price quantity _destroy]
    product_images_attributes: [:id product_id _destroy image]
  ).freeze

  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
  has_many :order_details, dependent: :destroy, through: :product_attributes
  has_many :product_images, dependent: :destroy

  scope :latest_product, ->{order created_at: :desc}
  delegate :name, to: :category, prefix: true

  accepts_nested_attributes_for :product_attributes, :product_images, allow_destroy: true

  validates :name, presence: true, uniqueness: true,
  length: {
    minium: Settings.const.products.name.length.min,
    maximum: Settings.const.products.name.length.max
  }
  validates :description, presence: true,
  length: {
    minium: Settings.const.products.description.length.min,
    maximum: Settings.const.products.description.length.max
  }

  def sum_quantity
    product_attributes.sum(:quantity)
  end
end
