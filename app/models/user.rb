class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true
  enum role: {
    user: Settings.const.users.role.user,
    admin: Settings.const.users.role.admin
  }

  before_save :email_downcase

  validates :name, presence: true,
    length: {
      minium: Settings.const.users.name.length.min,
      maximum: Settings.const.users.name.length.max
    }
  validates :email, presence: true,
    length: {
      minium: Settings.const.users.email.length.min,
      maximum: Settings.const.users.email.length.max
    },
    format: {with: Settings.const.users.email.regex},
    uniqueness: true

  validates :phone, presence: true, uniqueness: true

  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.const.users.password.length.min},
    allow_nil: true

  def email_downcase
    email.downcase!
  end
end
