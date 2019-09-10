class Location < ApplicationRecord
    has_many :smoking_posts
    accepts_nested_attributes_for :smoking_posts

    def self.create_location_with_smoking_post(latitude, longitude, title, body, current_user, location_smoking_post_params)
      if duplicate_location = self.find_by(latitude: latitude, longitude: longitude)
        duplicate_location.smoking_posts.create(user_id: current_user.id, title: title, body: body)
      else
        self.create(location_smoking_post_params)
      end
    end
end
