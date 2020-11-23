class Comment < ApplicationRecord
  scope :sorted, -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :post

  validates :content,  presence: true, length: { maximum: 1000 }
end
