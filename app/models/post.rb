class Post < ApplicationRecord
  scope :sorted, -> { order(created_at: :desc) }

  belongs_to :user
  has_many :comments

  validates :title,   presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :image,   presence: true

  mount_uploader :image, ImageUploader
end
