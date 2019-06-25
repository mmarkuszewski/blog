class User < ApplicationRecord
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_secure_password
end
