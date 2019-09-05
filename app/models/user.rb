class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :opinions

  # carrierwave
  mount_uploader :image_id, ImageUploader
  # paranoia
  acts_as_paranoid

  def withdraw_after_create_opinion!(params)
    opinions.create!(params)
    destroy!
  end
end
