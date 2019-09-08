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
  has_many :locations
  has_many :smoking_posts, through: :locations

  # carrierwave
  mount_uploader :image_id, ImageUploader
  # paranoia
  acts_as_paranoid

  def withdraw_after_create_opinion!(params)
    opinions.create!(params)
    destroy!
  end

  def create_location_with_smoking_post(latitude, longitude, title, body)
    if duplicate_location = self.locations.find_by(latitude: latitude, longitude: longitude)
      duplicate_location.smoking_posts.create!(title: title, body: body)
    else
      self.locations.create!(location_smoking_post_params)
    end
  end

end
