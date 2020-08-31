class Post < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :images, allow_destroy: true
  # バリデーション
  validates :name, presence: true, length: { maximum: 40}
  validates :images,presence: true
  validates :text, presence: true, length: { maximum: 1000 }

  def like_user(id)
    likes.find_by(user_id: id)
  end

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end

  # def user
  #   return User.find_by(id: self.user_id)
  # end

end
