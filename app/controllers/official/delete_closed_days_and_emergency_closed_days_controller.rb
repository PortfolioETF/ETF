class Official::DeleteClosedDaysAndEmergencyClosedDaysController < Official::ApplicationController

    def index
        #zoneでparseしないと探せない
        time = Time.zone.parse(params[:date])
        #時間が00:00:00で登録してあるのでbeginningで探す
        @date = current_cloak.emergency_closed_days.find_by(start_time: time.beginning_of_day)
    end

    def destroy
        current_cloak.emergency_closed_days.find(params[:id]).destroy!
        redirect_to official_cloak_calendar_path, notice: "休日を削除しました"
    end
end
