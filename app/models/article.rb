class Article < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  has_many :likes, dependent: :destroy
  validates :day, :body, presence: true
  validates :minutes, presence: true, numericality: { only_integer: true }
end