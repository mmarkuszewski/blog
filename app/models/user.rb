class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  validates :role, presence: true
  accepts_nested_attributes_for :comments

  def is_admin?
    self.role == 'admin'
  end
end
