class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :exercises, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :objective, length: { maximum: 140 }

  mount_uploader :profile_image, ImageUploader
end