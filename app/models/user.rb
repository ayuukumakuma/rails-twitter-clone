class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  # 自分がフォローしているユーザー
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'following_id'
  has_many :followings, through: :active_relationships, source: :follower

  # 自分をフォローしているユーザー
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id'
  has_many :followers, through: :passive_relationships, source: :following

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :timeoutable, :trackable

  # nameは必須かつ重複しないかつ20文字以内
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
end
