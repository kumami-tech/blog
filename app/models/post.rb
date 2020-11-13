class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
