class Reserf < ApplicationRecord
    validates :amount, presence: true
    validates :amount, numericality: { only_integer: true, greater_than: 0 }
    validates :start_time, presence: true
    validates :end_time, presence: true

    belongs_to :user
    belongs_to :cloak
end
