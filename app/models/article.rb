class Article < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates :day, :body, presence: true
  validates :minutes, presence: true, numericality: { only_integer: true }
end