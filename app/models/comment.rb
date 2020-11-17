class Comment < ApplicationRecord
  scope :sorted, -> { order(created_at: :desc) }

  belongs_to :post

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :content,  presence: true, length: { maximum: 1000 }
end
