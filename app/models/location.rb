class Location < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true

    has_many :smoking_posts, dependent: :destroy
    accepts_nested_attributes_for :smoking_posts

    def self.create_location_with_smoking_post(latitude, longitude, title, body, current_user, image_id, location_smoking_post_params)
      if duplicate_location = self.find_by(latitude: latitude, longitude: longitude)
        duplicate_location.smoking_posts.create(user_id: current_user.id, title: title, body: body, image_id: image_id)
      else
        self.create(location_smoking_post_params)
      end
    end

    def self.search(search)
      if !search || search.empty?
        '検索フォームに入力してください'
      elsif self.where(['address LIKE ?', "%#{search}%"]).empty?
        '検索結果: 0件'
      elsif self.where(['address LIKE ?', "%#{search}%"]).empty? == false
        self.where(['address LIKE ?', "%#{search}%"])
      else
        'もう一度お試しください'
      end
    end

    def self.search_result_smo_string?(target, params)
      if target.is_a?(String)
        []
      else
        target.page(params).per(5).preload(:smoking_posts).order(created_at: "DESC")
      end
    end

    def  self.be_error?(targets, search_locations)
      if targets.empty?
        search_locations
      end
    end
end
