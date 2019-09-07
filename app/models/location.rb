class Location < ApplicationRecord
    belongs_to :user
    has_many :smoking_posts
    accepts_nested_attributes_for :smoking_posts
end
