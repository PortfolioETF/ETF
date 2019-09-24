class Official::EmergencyClosedDaysController < ApplicationController

    def index
        render json: current_cloak.after_this_month_emergency_closed_days
    end

    def new
        @date = Date.parse(params[:date])
        @emergency_closed_day = EmergencyClosedDay.new
    end

    def create
        emergency_closed_day = current_cloak.emergency_closed_days.new(emergency_closed_day_params)
        emergency_closed_day.save!
        redirect_to official_cloak_calendar_path, notice: "休業日登録しました"
    end

    def destroy
        EmergencyClosedDay.find(params[:id]).destroy!
        redirect_to official_cloak_calendar_path, notice: "定休日登録しました"
    end

    private
    def emergency_closed_day_params
        params.require(:emergency_closed_day).permit(:start_time, :end_time)
    end
end
