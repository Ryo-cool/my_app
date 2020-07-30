class Post < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # バリデーション
  validates :name, presence: true, length: { maximum: 40}
  validates :images,presence: true
  validates :text, presence: true, length: { maximum: 1000 }

  def like_user(id)
    likes.find_by(user_id: id)
  end
end
