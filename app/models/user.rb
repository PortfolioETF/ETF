class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  # validations
  validates :name,uniqueness: true, presence: true
  validates :email, uniqueness_without_deleted: true

  # associations
  has_many :opinions
  has_many :smoking_posts, dependent: :destroy
  has_many :locations, through: :smoking_posts
  has_many :reserves
  has_many :reviews, dependent: :destroy

  # carrierwave
  mount_uploader :image_id, ImageUploader
  # paranoia
  acts_as_paranoid

  def withdraw_after_create_opinion!(params)
      opinions.create!(params)
      destroy!
  end
end
