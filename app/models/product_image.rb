class ProductImage < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :product
  validates :image, presence: true,
  format: {
    with: Settings.const.products.image.format_image,
    message: I18n.t("admin.products.new.validate_image")
  }
end
