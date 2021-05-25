class Artice < ApplicationRecord
  belongs_to :user
  validates :day, :minutes, :body, presence: true
end
