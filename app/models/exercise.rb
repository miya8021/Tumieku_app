class Exercise < ApplicationRecord
  belongs_to :user
  has_many :artices
  validates :name, presence: true
end