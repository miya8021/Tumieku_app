class Article < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :day, presence: true
  validates :body, presence: true, length: { maximum: 140 }
  validates :minutes, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..300 }

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end