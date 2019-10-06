class Review < ApplicationRecord
    validates :review, presence: true, length: {maximum: 200}

    belongs_to :user
    belongs_to :cloak
end
