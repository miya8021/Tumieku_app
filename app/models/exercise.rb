class Exercise < ApplicationRecord
  belongs_to :user
  has_many :artices, dependent: :destroy
  validates :name, presence: true
end