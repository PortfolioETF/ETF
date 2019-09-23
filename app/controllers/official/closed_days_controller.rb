class Official::ClosedDaysController < Official::ApplicationController

    def index
        closed_days = current_cloak.closed_days
        render json: closed_days
    end

    def new
        @cloak = current_cloak
        @closed_day = @cloak.closed_days.build
        @emergency_closed_days = current_cloak.emergency_closed_days.where("end_time > ?", Time.now)
    end

    def create
        length = ClosedDay.params_length(params[:cloak][:closed_days_attributes])
        ClosedDay.create_closed_days(length, current_cloak, params[:cloak][:closed_days_attributes])
        redirect_to official_cloak_path(current_cloak)
    end

    def destroy
        closed_day = ClosedDay.find(params[:id])
        closed_day.destroy!
        redirect_to cloak_path(current_cloak)
    end

    private
    def closed_day_params
        params.require(:closed_day).permit(:closed_day, :cloak_id)
    end

    def cloak_closed_day_params
        params.require(:cloak).permit(:image_id, :address, :cloak_name, :phone_number, :email, :availability, closed_days_attributes: [:closed_day, :cloak_id])
    end
end
