class Official::ReservesController < ApplicationController
    def index
        reserves = current_cloak.reserves.where("end_time > ?", Time.now.tomorrow)
        @reserves = reserves.preload(:user).page(params[:page]).per(10).order(created_at: 'DESC')
    end

    def destroy
        Reserf.find(params[:id]).destroy!
        redirect_to official_reserves_path, notice: "キャンセルしました"
    end
end
