class SmokingPost < ApplicationRecord
    validates :title, presence: true
    belongs_to :location
    belongs_to :user
    # carrierwave
    mount_uploader :image_id, ImageUploader
end
