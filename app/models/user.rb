class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  validates :name,        uniqueness: true
  validates :email,            uniqueness: true
end
