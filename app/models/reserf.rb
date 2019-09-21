class Reserf < ApplicationRecord
    validates :amount, presence: true
    belongs_to :user
    belongs_to :cloak
end
