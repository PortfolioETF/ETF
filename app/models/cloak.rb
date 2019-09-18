class Cloak < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :closed_days
  accepts_nested_attributes_for :closed_days
  has_one :cloak_location

  mount_uploader :image_id, ImageUploader

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

  def self.search_result_cloak_string?(target, params)
    if target.is_a?(String)
      []
    else
      target.page(params).per(5).order(updated_at: "DESC")
    end
  end

  def  self.be_error?(targets, search_locations)
    if targets.empty?
      search_locations
    end
  end
end
