class User < ApplicationRecord
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :role, presence: true
  has_secure_password
  accepts_nested_attributes_for :comments

  def is_admin?
    self.role == 'admin'
  end
end
