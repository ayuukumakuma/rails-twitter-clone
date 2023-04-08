class Tweet < ApplicationRecord
  belongs_to :user

  # Validate presence of content and user_id
  validates :content, :user_id, presence: true

  # Validate content length
  validates :content, length: { maximum: 140 }
end
