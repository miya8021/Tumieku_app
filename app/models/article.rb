class Article < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates :day, :minutes, :body, presence: true
end