class Relationship < ApplicationRecord
  # class_name:"User"を定義し、Userテーブルのレコードを参照
  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'
  validates :follower_id, uniqueness: {
    scope: :following_id,
    message: 'は同じユーザーを2回以上フォローできません'
  }
end