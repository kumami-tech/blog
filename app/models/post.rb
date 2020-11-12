class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true
end
