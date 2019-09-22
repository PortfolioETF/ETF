class CloakLocation < ApplicationRecord
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :description, presence: true, length: { maximum: 200 }

    belongs_to :cloak
end
