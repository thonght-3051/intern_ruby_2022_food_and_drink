class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, presence: true

  enum types: {default: 0, undefault: 1}, _suffix: true
end
