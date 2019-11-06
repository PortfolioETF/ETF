class Official::ReservesController < Official::ApplicationController
    def index
        reserves = current_cloak.reserves.where("end_time > ?", Time.now.tomorrow)
        @reserves = reserves.order(atart_time: 'DESC').preload(:user)
    end

    def destroy
        Reserf.find(params[:id]).destroy!
        redirect_to official_reserves_path, notice: "キャンセルしました"
    end
end
