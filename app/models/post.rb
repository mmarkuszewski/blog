class Post < ApplicationRecord
  include ImageUploader[:picture]
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  accepts_nested_attributes_for :comments

end
