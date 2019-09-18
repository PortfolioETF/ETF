class Cloak < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :closed_days
  accepts_nested_attributes_for :closed_days
  has_one :cloak_location

  mount_uploader :image_id, ImageUploader
end
