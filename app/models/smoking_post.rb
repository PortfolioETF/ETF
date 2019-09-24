class SmokingPost < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: {maximum: 200}


    belongs_to :location
    belongs_to :user
    # carrierwave
    mount_uploader :image_id, ImageUploader
end
