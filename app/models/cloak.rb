class Cloak < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness_without_deleted: true
  validates :cloak_name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :phone_number, presence: true, length: { maximum: 12 }
  validates :availability, presence: true
  validates :availability, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true

  has_many :closed_days, dependent: :destroy
  has_many :reserves
  accepts_nested_attributes_for :closed_days
  has_one :cloak_location, dependent: :destroy
  has_many :emergency_closed_days, dependent: :destroy
  has_many :reviews, dependent: :destroy

  mount_uploader :image_id, ImageUploader

  acts_as_paranoid

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

  def reserved_by_day(date)
    reserves.where(start_time: date.in_time_zone.all_day).sum(:amount)
  end

  def availability_remain?(reserved_by_day)
    availability = self.availability
    if availability - reserved_by_day > 0
      availability - reserved_by_day
    else
      '予約で埋まっている可能性があります。直接店舗にご確認下さい'
    end
  end

  def after_this_month_emergency_closed_days
    emergency_closed_days.where("end_time > ?", Time.now.beginning_of_month)
  end
end
