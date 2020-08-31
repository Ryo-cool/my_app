class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # 画像アップロード
  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  # アソシエーション
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  # フォロー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  # バリデーション
  validates :name,        uniqueness: true
  validates :email,            uniqueness: true

  # ゲストユーザーログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
    end
  end
  
  # いいねしているかの判定
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  # フォロー機能
  # フォローが自分自身でないか
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
# relationship が存在すれば destroy
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

end
