class ClosedDay < ApplicationRecord
    belongs_to :cloak
    validates :closed_day, presence: true

    enum closed_day: %i(日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日 定休日なし)

    def self.params_length(params)
        JSON.parse(params.to_json).length - 1
    end
    def self.create_closed_days(length, current_cloak, params)
        for i in 0..length do
            if current_cloak.closed_days.where(closed_day: params[:"#{i}"][:closed_day]).present?
                next
            else
              self.create(cloak_id: current_cloak.id, closed_day: params[:"#{i}"][:closed_day])
            end
        end
    end
end
