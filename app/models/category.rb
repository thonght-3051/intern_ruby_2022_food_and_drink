class Category < ApplicationRecord
  enum status: {active: 0, inactive: 1}
  ATTR_CATE = %i(name status).freeze
  has_many :products, dependent: :destroy

  validates :name, presence: true

  scope :latest_category, ->{order created_at: :desc}

  class << self
    def statuses_i18n
      statuses.each_with_object({}) do |(k, _), obj|
        obj[I18n.t("category.status.#{k}")] = k
      end
    end
  end

  def status_i18n
    I18n.t("category.status.#{status}")
  end
end
