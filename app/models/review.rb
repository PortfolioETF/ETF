class Review < ApplicationRecord
    belongs_to :user
    belongs_to :cloak
end
