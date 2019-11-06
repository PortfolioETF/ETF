class Official::ClosedDaysController < Official::ApplicationController

    def index
        closed_days = current_cloak.closed_days
        render json: closed_days
    end

    def new
        @cloak = current_cloak
        @closed_days = @cloak.closed_days.order(closed_day: "ASC")
        @closed_day = @cloak.closed_days.build
        @emergency_closed_days = current_cloak.emergency_closed_days.where("end_time > ?", Time.now)
    end

    def create
        #paramsはeachをかけるためここまでで渡す
        ClosedDay.create_closed_days(params[:cloak][:closed_days_attributes], current_cloak, flash)
        redirect_to official_cloak_path(current_cloak), notice: "定休日を登録しました"
    end

    def destroy
        closed_day = ClosedDay.find(params[:id])
        closed_day.destroy!
        redirect_to official_cloak_path(current_cloak), notice: "定休日削除しました"
    end

    private
    def closed_day_params
        params.require(:closed_day).permit(:closed_day, :cloak_id)
    end

    def cloak_closed_day_params
        params.require(:cloak).permit(:image_id, :address, :cloak_name, :phone_number, :email, :availability, closed_days_attributes: [:closed_day, :cloak_id])
    end
end
