class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'

  # following_id と follower_id が同じ組み合わせは許可しない
  validates :following_id, uniqueness: { scope: :follower_id }
end
