class Public::EmergencyClosedDaysController < Public::ApplicationController
    def index
        cloak = Cloak.find(params[:id])
        render json: cloak.after_this_month_emergency_closed_days
    end
end
