class SmokingPost < ApplicationRecord
    belongs_to :location
    belongs_to :user
    # carrierwave
    mount_uploader :image_id, ImageUploader
end
