class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :mountain

  validates :user_id, presence: true
  validates :mountain_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 200 }
end
