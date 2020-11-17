class Comment < ApplicationRecord
  scope :sorted, -> { order(created_at: :desc) }

  belongs_to :post

  validates :nickname, presence: true
  validates :content, presence: true
end
