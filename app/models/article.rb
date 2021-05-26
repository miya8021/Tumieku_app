class Article < ApplicationRecord
  belongs_to :user, :exercise
  validates :day, :minutes, :body, presence: true
end