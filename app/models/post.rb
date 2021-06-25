class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true

  def liked_by?(current_user)
    likes.exists?(user_id: current_user.id)
  end
end
