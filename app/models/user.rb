class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :objective, length: { maximum: 140 }

  mount_uploader :profile_image, ImageUploader
end