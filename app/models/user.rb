class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
  has_many :comments, dependent: :destroy
  # フォローしているユーザーとの関連
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # フォローされるユーザーとの関連
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, presence: true, length: { maximum: 30 }
  validates :objective, presence: true, length: { maximum: 140 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  mount_uploader :profile_image, ImageUploader

  RANK = 3

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.objective = "毎日5分運動する"
    end
  end

  def self.all_ranks
    @all_ranks = User.where.not(level: nil).order(level: :desc).limit(RANK).pluck(:id, :name, :level)
  end
end