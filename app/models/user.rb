class User < ApplicationRecord
  has_secure_password

  has_many :measurements
  validates :name, presence: true
  validates :name, length: { minimum: 4 }
  validates :email, presence: true
end
