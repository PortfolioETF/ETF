class Public::EmergencyClosedDaysController < ApplicationController
    def index
        cloak = Cloak.find(params[:id])
        render json: cloak.emergency_closed_days.where("end_time > ?", Time.now.beginning_of_month)
    end
end
