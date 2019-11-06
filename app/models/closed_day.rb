class ClosedDay < ApplicationRecord

    validates :closed_day, presence: true

    belongs_to :cloak

    enum closed_day: %i(日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日)


    def self.create_closed_days(params, current_cloak, flash)
        #空白渡さないとnillになり << で文字を入れられない
        flash[:notice_custom] = ""
        params.each do |p|
          day_of_the_week = p[1][:closed_day]
          if current_cloak.closed_days.where(closed_day: day_of_the_week).present?
            flash[:notice_custom] << "#{day_of_the_week} "
          else
            self.create(cloak_id: current_cloak.id, closed_day: day_of_the_week)
          end
        end
        if flash[:notice_custom] != ""
          flash[:notice_custom] << "は登録済みです"
        end
    end
end
