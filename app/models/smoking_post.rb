class SmokingPost < ApplicationRecord
    belongs_to :location
    # carrierwave
    mount_uploader :image_id, ImageUploader
end
