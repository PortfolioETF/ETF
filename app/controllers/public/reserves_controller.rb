class Public::ReservesController < Public::ApplicationController
    def index
        @reserves = current_user.reserves.page(params[:page]).per(10).order(updated_at: "DESC")
    end

    def new
        @date = Time.parse(params[:date])
        @cloak = Cloak.find(params[:id])
        reserved_by_day = @cloak.reserved_by_day(@date)
        @availability = @cloak.availability_remain?(reserved_by_day)
        @reserf = current_user.reserves.new
    end

    def create
        @date = Time.parse(params[:date])
        @cloak = Cloak.find(reserf_params[:cloak_id])
        @availability = params[:availability]
        @reserf = current_user.reserves.new(reserf_params)
        if @reserf.save
            redirect_to reserves_path, notice: "予約が完了しました"
        else
            render 'new'
        end
    end

    private
    def reserf_params
        params.require(:reserf).permit(:start_time, :end_time, :amount, :cloak_id)
    end
end
