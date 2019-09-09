class Location < ApplicationRecord
    belongs_to :user
    has_many :smoking_posts
    accepts_nested_attributes_for :smoking_posts

    def self.search(search) #ここでのself.はUser.を意味する
        if search
          where(['address LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。
        else
          all #全て表示。
        end
    end
end
